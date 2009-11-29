$(document).ready(function() {
  var class_to_url = {
    'NSObjectAdditions'       : '/api/additions',
    'NSObject Additions'      : '/api/additions#NSObject',
    'NSString Additions'      : '/api/additions#NSString',
    'NSData Additions'        : '/api/additions#NSData',
    'NSDate Additions'        : '/api/additions#NSDate',
    'NSArray Additions'       : '/api/additions#NSArray',
    'NSMutableArray Additions' : '/api/additions#NSMutableArray',
    'NSMutableDictionary Additions' : '/api/additions#NSMutableDictionary',
    'UIColor Additions'       : '/api/additions#UIColor',
    'UIFont Additions'        : '/api/additions#UIFont',
    'UIImage Additions'       : '/api/additions#UIImage',
    'UIViewController Additions' : '/api/additions#UIViewController',
    'UINavigationController Additions' : '/api/additions#UINavigationController',
    'UITabBarController Additions' : '/api/additions#UITabBarController',
    'UIView Additions'        : '/api/additions#UIView',
    'UITableView Additions'   : '/api/additions#UITableView',
    'UIWebView Additions'     : '/api/additions#UIWebView',
    'UIToolbar Additions'     : '/api/additions#UIToolbar',
    'UIWindow Additions'      : '/api/additions#UIWindow',

    'TTImageView'             : '/api/TTImageView',
    'TTImageViewDelegate'     : '/api/TTImageView#TTImageViewDelegate',
    'TTLauncherView'          : '/api/TTLauncherView',
    'TTLauncherViewDelegate'  : '/api/TTLauncherView#TTLauncherViewDelegate',
    'TTMessageController'     : '/api/TTMessageController',
    'TTMessageControllerDelegate' : '/api/TTMessageController#TTMessageControllerDelegate',
    'TTModel'                 : '/api/TTModel',
    'TTModelViewController'   : '/api/TTModelViewController',
    'TTNavigator'             : '/api/TTNavigator',
    'TTNavigatorDelegate'     : '/api/TTNavigator#TTNavigatorDelegate',
    'TTPopupViewController'   : '/api/TTPopupViewController',
    'TTShape'                 : '/api/TTShape',

    'TTStyle'                 : '/api/TTStyle',
    'TTStyleContext'          : '/api/TTStyle#TTStyleContext',
    'TTContentStyle'          : '/api/TTStyle#TTContentStyle',
    'TTPartStyle'             : '/api/TTStyle#TTPartStyle',
    'TTShapeStyle'            : '/api/TTStyle#TTShapeStyle',
    'TTInsetStyle'            : '/api/TTStyle#TTInsetStyle',
    'TTBoxStyle'              : '/api/TTStyle#TTBoxStyle',
    'TTTextStyle'             : '/api/TTStyle#TTTextStyle',
    'TTImageStyle'            : '/api/TTStyle#TTImageStyle',
    'TTMaskStyle'             : '/api/TTStyle#TTMaskStyle',
    'TTBlendStyle'            : '/api/TTStyle#TTBlendStyle',
    'TTSolidFillStyle'        : '/api/TTStyle#TTSolidFillStyle',
    'TTLinearGradientFillStyle' : '/api/TTStyle#TTLinearGradientFillStyle',
    'TTReflectiveFillStyle'   : '/api/TTStyle#TTReflectiveFillStyle',
    'TTShadowStyle'           : '/api/TTStyle#TTShadowStyle',
    'TTInnerShadowStyle'      : '/api/TTStyle#TTInnerShadowStyle',
    'TTSolidBorderStyle'      : '/api/TTStyle#TTSolidBorderStyle',
    'TTHighlightBorderStyle'  : '/api/TTStyle#TTHighlightBorderStyle',
    'TTFourBorderStyle'       : '/api/TTStyle#TTFourBorderStyle',
    'TTBevelBorderStyle'      : '/api/TTStyle#TTBevelBorderStyle',
    'TTLinearGradientBorderStyle' : '/api/TTStyle#TTLinearGradientBorderStyle',
    'TTStyleDelegate'         : '/api/TTStyle#TTStyleDelegate',

    'TTStyleSheet'            : '/api/TTStyleSheet',
    'TTURLMap'                : '/api/TTURLMap',
    'TTURLRequestModel'       : '/api/TTURLRequestModel',
    'TTView'                  : '/api/TTView',
    'TTViewController'        : '/api/TTViewController',
    'TTScrollView'            : '/api/TTScrollView',
    'TTScrollViewDelegate'    : '/api/TTScrollView#TTScrollViewDelegate',
    'TTScrollViewDataSource'  : '/api/TTScrollView#TTScrollViewDataSource',
    'TTYouTubeView'           : '/api/TTYouTubeView',
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
      width: '250px'
    })
    .result(function(event, data, formatted) {
      window.location = class_to_url[formatted];
    });
});
