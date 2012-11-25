(function($) {
  var generateRows = function(data) {
    var rows = '';
    $.each(data, function(index, row) {
      rows += '<tr><td>'+ row.name + '</td><td>'+ row.desc + '</td><td>' + row.tags + '</td></tr>';
    });
    return rows;
  };

  $(function() {
    $('#url_search_button').bind('click', function() {
      var query = $("#url_search_text").val();
      var parent = $(this).parent();
      parent.find('h2').html('Search results for "' + query + '"');

      $.ajax({
        url: '/url_search.json',
        dataType: "json",
        success: function(data) {
          var results = generateRows(data);
          parent.find('table tbody').html(results);
        }
      });
    });
  });
})(jQuery);
