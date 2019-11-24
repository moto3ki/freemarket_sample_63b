$(function(){
  /****************************************/
  /* 商品一覧調整関数                        */
  /****************************************/
  function itemListAdjust() {
    var empty_items = [];
    var cnt;
    
    var ww = $(window).width();
    
    // 画面幅 > 1429px
    if (ww >= 1429){
      cnt = 0;
    }
    // 858px < 画面幅 <= 1429px
    else if (858 <= ww && ww <  1429){
      cnt = 2;
    }
    // 画面幅 < 858px
    else if (ww < 858){
      cnt = 0;
    }
    // 前回追加した空のアイテム要素を削除
    $('.item-empty').remove();
    // 画面幅に応じて設定した空のアイテム要素を追加
    for (i = 0; i < cnt; i++) {
      empty_items.push($('<li>', { class: 'item-empty' }));
    }
    $('.item-lists__items').append(empty_items);
  }

  itemListAdjust();
  $(window).resize(function() {
    itemListAdjust();
  });
});
