$(function(){
  // 商品確認のチェックボックスクリック時
  $(document).on('click', '#confirmed-item', function(){
    var confirmed_check = $("#confirmed-item").prop("checked");
    var rate_select = $('input[name="todolist[rate]"]:checked').val();
    // チェック済かつ評価済の場合
    if (confirmed_check == true && rate_select != undefined)
    {
      $(".rate-post").removeAttr("disabled");
      $('.rate-post').css('background-color','#ea352d');
    }
    else{
      // $(".rate-post").removeAttr("disabled");
      $(".rate-post").prop('disabled', true);
      $('.rate-post').css('background-color','#888888');
    }
  });

  // 評価ボタンクリック時
  $(document).on('click', '.face-select', function(){
    // 前回選択していたclassを削除
    $('.face-select').removeClass('selected');
    // 選択した評価にclassを設定
    $(this).addClass('selected');
    var confirmed_check = $("#confirmed-item").prop("checked");
    // 商品確認のチェックボックスがチェックされている場合
    if (confirmed_check === true){
      // ボタンのdisabledを解除
      $(".rate-post").removeAttr("disabled");
      $('.rate-post').css('background-color','#ea352d');
    }
  });
});