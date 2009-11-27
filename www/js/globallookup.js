$(document).ready(function() {
  var class_to_url = {
    'TTLauncherView'          : '/api/TTLauncherView',
    'TTLauncherViewDelegate'  : '/api/TTLauncherView#TTLauncherViewDelegate',
    'TTMessageController'     : '/api/TTMessageController',
    'TTModel'                 : '/api/TTModel',
    'TTModelViewController'   : '/api/TTModelViewController',
    'TTNavigator'             : '/api/TTNavigator',
    'TTNavigatorDelegate'     : '/api/TTNavigator#TTNavigatorDelegate',
    'TTShape'                 : '/api/TTShape',
    'TTStyle'                 : '/api/TTStyle',
    'TTStyleSheet'            : '/api/TTStyleSheet',
    'TTURLMap'                : '/api/TTURLMap',
    'TTURLRequestModel'       : '/api/TTURLRequestModel',
    'TTViewController'        : '/api/TTViewController',
    'TTWebController'         : '/api/TTWebController'
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
