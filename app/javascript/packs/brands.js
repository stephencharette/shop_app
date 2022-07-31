$(document).on('turbolinks:load', () => {
  $('#brand_search').on('input', function () {
    getBrandsBySearch("brand_search");
  });
});

var getBrandsBySearch = (dropdownID) => {
  var search = $('#' + dropdownID).val();
  $.ajax({
    url: '/brands',
    type: 'GET',
    dataType: 'json',
    data: { search: search },
    success: function (brands) {
      var prompt = null;
      if (!search) prompt = '... waiting for selection'
      clearDropdown('item_brand_dropdown', prompt);
      populateDropdown('item_brand_dropdown', brands);
    }
  });
}

$(document).on('turbolinks:load', () => {
  $('#item_brand_search_clear').on('click', function () {
    $('#brand_search').val("");
    getBrandsBySearch("brand_search");
  });
});

// Utilities
var clearDropdown = (id, prompt) => {
  var dropdown = $('#' + id);
  dropdown.empty();
  if (!!prompt) {
    dropdown.append(
      $('<option></option>').val(null).html(prompt)
    );
  }
}

var populateDropdown = (id, data) => {
  var dropdown = $('#' + id);
  $.each(data, function (index, name_and_id) {
    dropdown.append(
      $('<option></option>').val(name_and_id[1]).html(name_and_id[0])
    );
  });
}