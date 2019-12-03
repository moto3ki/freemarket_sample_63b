$(function() {

  function calcProfit() {
    var   price    = $('#item-price').val();
    const sell_fee_rate = 0.1;
    var sell_fee = 0;
    var profit = 0;

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
