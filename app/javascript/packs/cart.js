$(document).on('turbolinks:load', () => {
  $('input[id^=cart_item]').on('change', function () {
    var dom_id = $(this).attr('id');
    var cart_item_id = $(this).attr('id').replace('cart_item_', '');
    var updated_quantity = $(this).val();
    $.ajax({
      url: 'cart_items/' + cart_item_id,
      type: 'PATCH',
      data: {
        ajax: true,
        cart_item: {
          quantity: updated_quantity
        }
      },
      success: function(data) {
      },
      error: function(xhr, data, response) {
        console.log(dom_id);
        $('#' + dom_id).val(updated_quantity - 1);
      }
    });
  });
});