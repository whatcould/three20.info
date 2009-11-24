<h1><?= $this->pageTitle() ?></h1>
<div class="source">Source: <a href="http://wiki.github.com/facebook/three20/url-based-navigation">github</a></div>

<p>Navigation in iPhone apps can be challenging - there is no single prescribed way to open a view
  and pass data into it. Most applications rely on each view having a particular API that the
  callers must know. This leads to a lot of boilerplate code to open the same view from multiple
  locations in your application.</p>

<p>The URL-based navigation in <span class="inline">TTNavigator</span> provides a standard way to
  navigate the user from one view to another, with built-in understanding of some of the standard
  iPhone interfaces like UINavigationController, UITabBarController, and more.</p>

<h1>Introduction</h1>

<p>The concept behind <span class="inline">TTNavigator</span> is similar to
  <a href="http://api.rubyonrails.org/classes/ActionController/Routing.html">Ruby on Rails' routing</a>
  in that you link URL patterns to code in a url <i>map</i>. Callers simply request a url, and
  <span class="inline">TTNavigator</span> will find the appropriate code to run. This means that
  the url map makes a semantic distinction between <i>what</i> you want to display, and <i>how</i>
  you want to display it. The most common pattern is to have a single, shared navigator used across
  your whole application.</p>

<p>Here's an example to get started. Typically this appears in your Application Delegate's
  <span class="inline">applicationDidFinishLaunching:</span> selector.</p>

<div class="code"><pre>TTNavigator* navigator = [TTNavigator navigator];
navigator.window = window;

TTURLMap* map = navigator.URLMap;
[map from:@"tt://restaurant/(initWithName:)"
  toViewController:[RestaurantController class]];
</pre></div>

<p>The above refers to a class, <span class="inline">RestaurantController</span>, with a selector,
  <span class="inline">initWithName:</span></p>

<div class="code"><pre>-(void) initWithName: (NSString*)name {
  ...
}</pre></div>

<p>This establishes a simple map which recognizes one url. Imagine that you wanted to open the
  restaurant controller for a given restaurant. For instance, Chotchkie's.</p>

<p>Typically you'd do it this way, if you were embedded in a UINavigationController:</p>

<div class="code"><pre>RestaurantController* controller = [[RestaurantController alloc]
  initWithName:@"Chotchkie's"];
[navigationController pushViewController:controller animated:YES];
[controller release];</pre></div>

<p>This is a lot of boilerplate. The only reason to keep <span class="inline">controller</span>
  around is to add it to the UINavigationController, and release it. Really, you just want to
  "open this view in the current context" and be done with it.</p>

<p>With TTNavigator, just open this url with:</p>

<div class="code"><pre>[[TTNavigator navigator] openURL:@"tt://restaurant/Chotchkie's" animated:YES]</pre></div>

<p>When <span class="inline">openURL:animated:</span> is called, an instance of
  <span class="inline">RestaurantController</span> will be allocated, and then the
  <span class="inline">initWithName:</span> selector will be invoked with
  <span class="inline">@"Chotchkie's"</span> as the value of the first parameter.</p>

<h1>Persistence</h1>

<p>One huge advantage of using <span class="inline">TTNavigator</span> is the fact that the user's
  entire navigation state can be persisted automatically based on these URLs. This means that if
  you have a tab bar with navigation controllers, <span class="inline">TTNavigator</span> will
  remember the "stack" of urls that the user has navigated using
  <span class="inline">openURL:animated:</span>. The next time the application is launched,
  the user will be shown exactly the navigation state as the last time they launched the
  application.</p>

<p><span class="inline">TTNavigator</span> is smart enough to only persist the URLs, and avoid
  re-instantiating a whole stack of views on startup. So if the user is 10 levels deep into a
  UINavigationController, only the most recent view will be instantated at startup. The user will,
  however, be able to navigate backwards using UINavigationController's "back" button, and the
  views will be instantiated on demand.</p>

<p>Be careful with this though, because it is easy to accidentally write code where a view is
  dependent on state that has been initialized in a previous view.</p>

<h2>Enabling persistence</h2>

<p>The default persistence mode of TTNavigator is
  <span class="inline">TTNavigatorPersistenceModeNone</span>. To enable persistence you will need
  to choose one of the other two persistence modes before you call
  <span class="inline">restoreViewControllers</span>. Within your
  <span class="inline">applicationDidFinishLaunching:</span> method (or wherever you initialize
  the navigator) you can set one of three persistence modes.</p>

<ul>
  <li><span class="inline">TTNavigatorPersistenceModeNone</span> - No persistence.</li>
  <li><span class="inline">TTNavigatorPersistenceModeTop</span> - Persist only the first URL in the
    history.</li>
  <li><span class="inline">TTNavigatorPersistenceModeAll</span> - Persist the entire history.</li>
</ul>

<p>To set the persistence mode, set the <span class="inline">persistenceMode</span> property of
  <span class="inline">TTNavigator</span>.</p>

<div class="code"><pre>TTNavigator* navigator = [TTNavigator navigator];
navigator.persistenceMode = TTNavigatorPersistenceModeAll;</pre></div>

<h1>URL mapping methods</h1>

<p>There are two methods of mapping that you should be aware of.  Mapping from URLs to Controllers,
  and mapping from NSObjects to URLs (which are generally then mapped to controllers). We'll start
  with the simpler case.</p>

<h2>URLs to Controllers</h2>

<p>The first form is when you have a url, say "tt://menu/order", and this is being mapped to a
  Controller. Let's say we have the following map (from TTNavigatorDemo):</p>

<div class="code"><pre>[map from:@"tt://menu/(initWithMenu:)"
  toSharedViewController:[MenuController class]];</pre></div>

<p>Opening "tt://menu/1" will call</p>

<div class="code"><pre>[[MenuController alloc] initWithMenu:1]</pre></div>

<p>This extends for multiple parameters, also. Let's say we want to display a specific page in
  MenuController.</p>

<div class="code"><pre>[map from:@"tt://menu/(initWithMenu:)/(page:)"
  toSharedViewController:[MenuController class]];</pre></div>

<p>Opening "tt://menu/1/5" will call</p>

<div class="code"><pre>[[MenuController alloc] initWithMenu:1 page:5]</pre></div>

<h3>Other data types</h3>

<p>Parameters will automatically map to the method's data types. In the above examples we've
  assumed that <span class="inline">initWithMenu</span> has this signature</p>

<div class="code"><pre>- (id)initWithMenu:(MenuPage)page</pre></div>

<p>Where <span class="inline">MenuPage</span> is an enum (effectively an int).</p>

<p>We could also map parameters to strings if we wanted.</p>

<div class="code"><pre>- (id)initWithMenuName:(NSString*)name</pre></div>

<p>The map:</p>

<div class="code"><pre>[map from:@"tt://menu/(initWithMenuName:)"
  toSharedViewController:[MenuController class]];</pre></div>

<p>Opening "tt://menu/lunch" will call</p>

<div class="code"><pre>[[MenuController alloc] initWithMenuName:@"lunch"]</pre></div>

<h2>NSObjects to URLs</h2>

<p>NSObjects in three20 have the ability to be mapped to URLs via the
  <span class="inline">URLValueWithName</span> addition in NSObjectAdditions.h.</p>

<p>This is an incredibly useful feature when populating a table with items. So how does it work?</p>

<p>First off, let's consider a basic NSObject:</p>

<div class="code"><pre>@interface Contact : NSObject {

}

@property (nonatomic, retain) NSNumber* uid;
@property (nonatomic, retain) NSString* firstName;
@property (nonatomic, retain) NSString* lastName;

@end</pre></div>

<p>We want to populate a table controller with a list of Contacts. Upon tapping any contact in
  the list, you should be taken to a view that shows the Contact details. Using TTTableItems we
  can set a URL for each table item, but how do we generate this URL?</p>

<p>Introducing the NSObject TTURL map:</p>

<div class="code"><pre>[map from:[Contact class] name:@"view" toURL:@"tt://contact/view/(uid)"];</pre></div>

<p>Calling <span class="inline">[aContact URLValueWithName:@"view"]</span> will generate a URL
  specifically for aContact.</p>

<div class="code"><pre>Contact* aContact = [[Contact alloc]
  initWithFirstName:@"Johnny" lastName:@"Appleseed" uid:1];
NSString* url = [aContact URLValueWithName:@"view"];
// url = @"tt://contact/view/1"</pre></div>

<p>This can then be mapped through a URL to Controller map as discussed above.</p>

<h3>Parameter substitution</h3>

<p>You may have noticed from the example above that mapping an object to a URL allows you to use
  properties from the NSObject to create the URL. Simply include the parameter name, surrounded by
  (parenthesis), and <span class="inline">URLValueWithName</span> will automatically substitute
  it. Any property of the NSObject can be used to generate the URL, allowing you to break the
  object down into a unique URL representation.</p>

<h1>Native parameters</h1>

<p>One of the first questions people ask about TTNavigator is how to pass native objects around,
  rather than encoding them somehow in a URL. There is a simple pattern for this, using the
  <span class="inline">query:</span> version of the <span class="inline">openURL:animated:</span>
  selector, <span class="inline">openURL:query:animated:query:</span>. For example, imagine you
  wanted to pass along an <span class="inline">NSArray</span> of items to show in the new view:</p>

<div class="code"><pre>NSArray *arr = [...load up with data...];
[[TTNavigator navigator] openURL:@"tt://restaurant/Chotchkie's" 
  query:[NSDictionary dictionaryWithObject:arr forKey:@"arraydata"],
  animated:YES]</pre></div>

<p>In this example, the array is passed directly to the initWithName: but only if there is a
  matching selector that accepts the query:</p>

<div class="code"><pre>-(id) initWithName: (NSString*)name query:(NSDictionary*)query {
  for (MyObject* item in [query objectForKey:@"arrayData"])
    ... do something with item ...
  }

  ...
}</pre></div>

<p>There is a catch to using this related to persistence. If the user quits the application
  after this instance of the MenuController's view shows up on screen, then the next launch
  of this application will load the url
  <span class="inline">@"tt://restaurant/Chotchkie's"</span> but the
  <span class="inline">query:</span> argument will be <span class="inline">nil</span>.</p>

<p>A general solution to this problem is to encode a unique id into the URL.
  This unique id can then be used to load the data in question whenever the controller loads and
  with zero dependency upon previous controllers.</p>

<h1>Troubleshooting</h1>

<p>URL-based navigation leads to some powerful functionality, but there are aspects of three20's
  url routing system that don't always work as expected.</p>

<h2>Subtle differences between toViewController and toSharedViewController in tables</h2>

<p>There are multiple ways to map a URL to a controller.  Two such methods are
  <span class="inline">toViewController</span> and
  <span class="inline">toSharedViewController</span>. These two methods have a gotcha when used in
  table items that do <i>not</i> have a accessoryURL.</span>

<p>If the item's URL is mapped with <span class="inline">toViewController</span>, then the table
  view will set the cell
  <span class="inline">accessoryType</span> to
  <span class="inline">UITableViewCellAccessoryDisclosureIndicator</span>. URLs mapped with
  <span class="inline">toSharedViewController</span> will set the cell
  <span class="inline">accessoryType</span> to
  <span class="inline">UITableViewCellAccessoryNone</span>.</p>
