function remove_fields_invoice(link){
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".line_item_row").hide();
}

function add_fields_invoice(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  // $(link).parent().before(content.replace(regexp, new_id));
  // $('#invoijace > tbody:last').append(content.replace(regexp, new_id));
  $('.add_a_line_row').before(content.replace(regexp, new_id));
}

// get invoce grand total
function getTotal(lines) {
  var total = 0;
  $.each(lines, function(){
    total += parseFloat($(this).html());
  });
  $('#total-price').html('$' + total.toFixed(2));
}

function getLineItemTotals(lines){
  $.each(lines, function(){
    row_total = 0;
    var price = parseFloat($(this).find('.price').val()); // get price
    var qty = parseFloat($(this).find('.qty').val()); // get quantity
    /* Check if quantity or price are empty */
    if(!qty) qty = '0';
    if(!price) price = '0';
    row_total = price * qty; // row_total = parseFloat($(this).find('.price').val()) * parseFloat($(this).find('.qty').val());
    // $($(this).find('.lineitemtotal')).html(roundNumber(row_total,2));
    $($(this).find('.lineitemtotal')).html(row_total.toFixed(2));
  })
}

/* is this function roundNumber even being used? */
function roundNumber(num,dec){
  var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
  return result;
}

// new items will be populated with default data
// http://stackoverflow.com/questions/8524126/function-stops-working-on-new-items
$(document).on("change", ".product", function(){
// $(document).on("blur", ".product", function(){
  var optionElem = $(this).find(":selected")[0]; // <option value="3" data-defaultQuantity="1">product name</option>
  $(this).closest('.item').find('.qty').val(optionElem.dataset.defaultquantity); // replace quantity
  $(this).closest('.item').find('.price').val(optionElem.dataset.price); // replace price
  $(this).closest('.item').find('.description').val(optionElem.dataset.description); // replace price

  var line = $('.item');
  getLineItemTotals(line);
  var line_totals = $('.lineitemtotal');
  getTotal(line_totals);
  $('#total-price').effect('highlight',{},3000);
});

$(document).on("blur", ".price", function(){
  // price change
  var price = $('.price');
  price.blur(function(){
    var line = $('.item');
    getLineItemTotals(line);
    var line_totals = $('.lineitemtotal');
    getTotal(line_totals);
    $('#total-price').effect('highlight',{},3000);
  });
});

$(document).on("blur", ".qty", function(){
  // price change
  var qty = $('.qty');
  qty.blur(function(){
    var line = $('.item');
    getLineItemTotals(line);
    var line_totals = $('.lineitemtotal');
    getTotal(line_totals);
    $('#total-price').effect('highlight',{},3000);
  });
});

$(document).ready(function() {

  // This happends when the page loads
  // getLineItemTotals(lines);
  // getTotal(lines);

  var line = $('.item');
  // so the line totals are calculated on page load
  getLineItemTotals(line);

  var line_totals = $('.lineitemtotal');
  getTotal(line_totals); // So the total is calculated on page load.

});

