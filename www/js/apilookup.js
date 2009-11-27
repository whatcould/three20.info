$(document).ready(function() {
  var names = [];
  var name_to_id = {};
  $('h3').each(function() {
    if( $(this).attr('id') ) {
      names.push($(this).text())
      name_to_id[$(this).text()] = $(this).attr('id');
    }
  });
  $("#apilookup")
    .placeholder()
    .autocomplete(names, {
      autoFill: false,
      mustMatch: false,
      matchContains: true,
      width: '400px'
    })
    .result(function(event, data, formatted) {
      window.location.hash = name_to_id[formatted];
    });
});
