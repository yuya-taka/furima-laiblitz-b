

$(document).on('turbolinks:load', function() {
  $('#item-price').on('change', function() {
    var price = $(this).val();
    var tax = price * 0.1; // 販売手数料は価格の10%
    var profit = price - tax; // 販売利益は価格から販売手数料を差し引いたもの
    
    $('#add-tax-price').text(tax.toFixed(0)); // 販売手数料を表示する要素に価格を設定
    $('#profit').text(profit.toFixed(0)); // 販売利益を表示する要素に価格を設定
  });
});
