$(function() {

  var inputs  =[];
  var item_images = [];
  var image_count = 0
  var preview = $('.preview');

  /****************************************/
  /* 画像追加関数                           */
  /****************************************/
  $(document).on('change', 'input[type= "file"].set-image',function() {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    // 画像プレビュー
    reader.onload = function(e) {
      var btn_wrapper = $(`<div class="delete-btn blue-link new-image-del">削除</div>`);
      img.append(btn_wrapper);
      img.find('img').attr('src', e.target.result)
    }
    reader.readAsDataURL(file);
    // 追加した画像を配列に設定
    item_images.push(img);
    // 既存画像の情報を取得（edit）
    var image_ids = $(".img_view").map(function(){
      return $(this).data('already-image-no');
    }).toArray();

    // 追加した画像にdata属性を付与する
    $.each(item_images, function(index, image) {
      image.attr('data-image-no', index);
      preview.append(image);
    });
    image_count = item_images.length + image_ids.length;
    if (image_count < 3) {
      $('.upload1').width(`calc(540px - 130px * ${image_count})`);
    }
    else if(3 <= image_count && image_count < 5) {
      $('.upload1').width(`calc(540px - 130px * ${image_count})`);
      $('.upload1__message').text('');
      $('.upload1__message').append(`<i class="fas fa-camera"></i>`);
    }
    else if(image_count == 5) {
      $('.upload1').hide();
    }
    var new_image = $(`<input name="item_images[image][]" class="set-image img-hidden" id="set-image" data-image-no=${item_images.length} type="file">`);
    $('.upload1').prepend(new_image);
  });
  
  /****************************************/
  /* 新規画像削除関数(new)                  */
  /****************************************/
  $(document).on('click', '.new-image-del', function(){
    // 選択された親要素である画像を取得
    var target_image = $(this).parent();
    // 選択された画像に設定されているdata属性を取得
    var image_no = $(target_image).data('image-no');
    // 指定のdata属性が振られているpreviewとinputを削除
    var del_elem = $(`[data-image-no="${image_no}"]`);
    del_elem.remove();
    item_images.splice(image_no, 1);
    // 削除したデータ属性より大きいデータ属性が設定されている要素に対してdata属性を設定し直す
    for (var i = 0; i < item_images.length - image_no; i++) {
      a1 = $(`[data-image-no="${image_no + i + 1}"]`);
      $(a1).data('image-no', image_no + i);
    }
    // 現在の幅を取得し、画像の幅分アップロードゾーンの幅をプラス
    var current_width = $(".upload1").width();
    $(".upload1").width(`calc(${current_width}px + 130px)`);
  });

  /****************************************/
  /* 既存画像削除関数（edit）                */
  /****************************************/
  $(document).on('click', '.already-image-del', function(){
    var target_image = $(this).parent();
    target_image.remove();
    var current_width = $(".upload1").width();
    $(".upload1").width(`calc(${current_width}px + 130px)`);
    var item_image_id = target_image.data('already-image-no');
    $('.del-image-list').append(`<input value=${item_image_id} type="hidden" name="del_item_images[id][]" id="item_id"></input>`);
  });

  /****************************************/
  /* 画像表示関数（edit）                   */
  /****************************************/
  var url = location.href.split("/");
  var last_url = url[url.length - 1];
  var first_url  = url[url.length - 3];
  if (first_url == 'items' && last_url == 'edit') {
    
    var image_ids = $(".img_view").map(function(){
      return $(this).data('already-image-no');
    }).toArray();

    var current_width = $(".upload1").width();
    $(".upload1").width(`calc(${current_width}px - 130px * ${image_ids.length})`);
  }

  /****************************************/
  /* カテゴリーボックス出力関数               */
  /****************************************/
  function addCategoryBox(children, category_no) {
    // selectboxを追加
    let html = `<select class='select-box' name="item[category_id]" id="item_category_id${category_no}">
                <option value="">---</option>`;
    // 取得したcategoryレコード分プルダウンを追加
    children.forEach(function(child){
      html = html + `<option value=${child.id}>${child.name}</option>`;
    });
    // 前回のプルダウンを削除
    $(`#item_category_id${category_no}`).remove();
    // 親カテゴリが変更された場合、３個目のプルダウンも削除
    if(category_no == 2){
      $('#item_category_id3').remove();
    }
    // selectboxを追加
    $(".item-detail-box__select__category__pulldown").append(html);
  }
  
  function ajaxSearch(category_id, id_tag){
    var category_no = 0;
    // 変更があったselectboxをもとにselectboxにつけるID名を設定
    if (id_tag == 'item_category_id') {
      category_no = 2;
    }
    else if(id_tag == 'item_category_id2') {
      category_no = 3;
    }
    // 非同期で子カテゴリの情報を取得
    $.ajax({
      type: 'GET',
      url: '/categories/search',
      data: { category_id: category_id },
      dataType: 'json'
    })
    .done(function(children) {
      addCategoryBox(children, category_no);
    })
    .fail(function() {
      alert("通信に失敗しました");
    });
  }
  // 親カテゴリが変更された場合
  $(document).on('change', '#item_category_id', function(){
    var category_id = $("#item_category_id").val();
    var id_tag = $(this).attr('id');
    ajaxSearch(category_id, id_tag);
  });
  // 子カテゴリが変更された場合
  $(document).on('change', '#item_category_id2', function(){
    var category_id = $("#item_category_id2").val();
    var id_tag = $(this).attr('id');
    ajaxSearch(category_id, id_tag);
  });
  /****************************************/
  /* 販売利益算出関数                       */
  /****************************************/
  function calcProfit() {
    var   price    = $('#item-price').val();
    const sell_fee_rate = 0.1;
    var   sell_fee = 0;
    var   profit = 0;

    // 販売手数料算出
    sell_fee = price * sell_fee_rate;
    // 販売手数（切り捨て）
    sell_fee = Math.floor(sell_fee);
    // 販売利益算出
    profit = price - sell_fee;

    if (price >= 300) {
      $("#item-sell-fee").text("¥" + sell_fee.toLocaleString());
      $("#item-sell-profit").text("¥" + profit.toLocaleString());
    }
    else {
      $("#item-sell-fee").text("-");
      $("#item-sell-profit").text("-");
    }
  }

  var price_input = $("#item-price");
  
  calcProfit();
  price_input.keyup(calcProfit);

});
