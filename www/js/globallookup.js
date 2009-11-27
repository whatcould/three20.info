$(document).ready(function() {
  var class_to_url = {
    'TTNavigator'             : '/api/TTNavigator',
    'TTNavigatorDelegate'     : '/api/TTNavigator#TTNavigatorDelegate',
    'TTURLMap'                : '/api/TTURLMap',
    'TTLauncherView'          : '/api/TTLauncherView',
    'TTLauncherViewDelegate'  : '/api/TTLauncherView#TTLauncherViewDelegate',
    'TTViewController'        : '/api/TTViewController',
    'TTWebController'         : '/api/TTWebController',
    'TTMessageController'     : '/api/TTMessageController',
  };
  var class_names = [];
  for( var key in class_to_url ) {
    class_names.push(key);
  }
  $("#globallookup")
    .placeholder()
    .autocomplete(class_names, {
      autoFill: false,
      mustMatch: false,
      matchContains: true,
      width: '186px'
    })
    .result(function(event, data, formatted) {
      window.location = class_to_url[formatted];
    });
});
