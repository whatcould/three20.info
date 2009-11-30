How to build a GitHub iPhone app with three20
=============================================

<div class="source">
  <a href="/tutorials/githubintro">Intro</a> -
  User Model -
  <a href="/tutorials/githubpage3">User View</a> -
  <a href="/tutorials/githubpage4">User Search</a>
</div>

At this point you should have a User view controller that simply sits there with a spinner,
perpetually loading. Let's figure out that loading part now.

We'll start by implementing a model. In this particular case, we're going to build a
`TTURLRequestModel`.

Add a new class to your project titled `UserModel`. Open the .h file and make `UserModel` inherit
from `TTURLRequestModel`. We'll also add a username property so that we can build our API request.

<div class="sectiontags" markdown="1">
* UserModel.h
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @interface UserModel : TTURLRequestModel {
      NSString* _username;
    }

    @property (nonatomic, copy) NSString* username;

    - (id)initWithUsername:(NSString*)username;

    @end

Next, within the .m file, add the following code.

<div class="sectiontags" markdown="1">
* UserModel.m
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @implementation UserModel

    @synthesize username = _username;

    - (id)initWithUsername:(NSString*)username {
      if( self = [self init] ) {
        self.username = username;
      }

      return self;
    }

    - (void)dealloc {
      TT_RELEASE_SAFELY(_username);
      [super dealloc];
    }

    - (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
      if( !self.isLoading && !TTIsEmptyString(_username) ) {
        NSString* url = [@"http://github.com/api/v2/json/user/show/"
          stringByAppendingString:_username];

        TTURLRequest* request = [TTURLRequest
          requestWithURL: url
                delegate: self];

        id<TTURLResponse> response = [[TTURLDataResponse alloc] init];
        request.response = response;
        TT_RELEASE_SAFELY(response);

        [request send];
      }
    }

    @end

Now that we've created our model, let's attach it to a data source. Create a data source
object titled `UserDataSource`. We're going to inherit from the `TTSectionedDataSource` class so
that we can have nice grouped sections of information.

<div class="sectiontags" markdown="1">
* UserDataSource.h
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @class UserModel;

    @interface UserDataSource : TTSectionedDataSource {
      UserModel* _usermodel;
    }

    - (id)initWithUsername:(NSString*)username;

    @end

Next, within the .m file, add the following code.

<div class="sectiontags" markdown="1">
* UserDataSource.m
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    ...
    #import "UserModel.h"

    @implementation UserDataSource

    - (id)initWithUsername:(NSString*)username {
      if( self = [self init] ) {
        _usermodel = [[UserModel alloc] initWithUsername:username];
      }

      return self;
    }

    - (void)dealloc {
      TT_RELEASE_SAFELY(_usermodel);

      [super dealloc];
    }

    - (id<TTModel>)model {
      return _usermodel;
    }

    - (void)tableViewDidLoadModel:(UITableView*)tableView {
      NSMutableArray* sections = [[NSMutableArray alloc] init];
      NSMutableArray* items = [[NSMutableArray alloc] init];

      self.sections = sections;
      self.items = items;

      TT_RELEASE_SAFELY(sections);
      TT_RELEASE_SAFELY(items);
    }


    @end

Great, we've almost built the necessary structure for a full request-based table controller. The
final addition we need to make is in the `UserViewController.m` file.

<div class="sectiontags" markdown="1">
* UserViewController.m
* Additions
</div>
<div class="clearfix"></div>

."brush: obj-c"
    ...

    #import "UserDataSource.h"

    ...

    - (void)createModel {
      self.dataSource = [[[UserDataSource alloc] initWithUsername:_username]
        autorelease];
    }

If you build and run the app now, your User view controller should appear and the loading text
should disappear after a moment. This means that the request was sent, returned, and the model was
loaded. Nothing will be shown yet, however, as we've yet to actually parse the response!

Parsing the Response
====================

In order to parse the response data, we're going to use the built-in NSXMLParser for simplicity's
sake. If you're feeling adventurous or you just plain prefer it, you can grab the JSON parsing
library instead.

Let's get to some code. We'll start off by adding some objects to our Model class.

<div class="sectiontags" markdown="1">
* UserModel.h
* Additions
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @interface UserModel : TTURLRequestModel {
      NSString*             _username;
      NSMutableDictionary*  _properties;
      NSString*             _activePropertyKey;
      NSString*             _activePropertyType;
    }
 
    @property (nonatomic, copy)     NSString*             username;
    @property (nonatomic, readonly) NSMutableDictionary*  properties;

Don't forget to release our new objects.

<div class="sectiontags" markdown="1">
* UserModel.m
* Additions
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)dealloc {
      TT_RELEASE_SAFELY(_username);
      TT_RELEASE_SAFELY(_properties);
      TT_RELEASE_SAFELY(_activePropertyKey);
      TT_RELEASE_SAFELY(_activePropertyType);

      [super dealloc];
    }

Now we can start parsing our data. Let's start by initializing the XML parser:

<div class="sectiontags" markdown="1">
* UserModel.m
* Additions
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)requestDidFinishLoad:(TTURLRequest*)request {
      TTURLDataResponse* response = request.response;

      // Useful debugging logic.
      // NSString* string = [[NSString alloc] initWithData: response.data
      //                                          encoding: NSUTF8StringEncoding];
      // NSLog(@"string: %@", string);
      // TT_RELEASE_SAFELY(string);

      // Ensure that we don't cause a leak.
      TT_RELEASE_SAFELY(_properties);
      _properties = [[NSMutableDictionary alloc] init];

      NSXMLParser* parser = [[NSXMLParser alloc] initWithData:response.data];
      parser.delegate = self;
      [parser parse];
      TT_RELEASE_SAFELY(parser);

      [super requestDidFinishLoad:request];
    }

This will initialize the parser and begin parsing, so now we need to handle the callback methods.
We parse the xml based on the spec defined on
[the github users API page](http://develop.github.com/p/users.html). You can test this out yourself
with curl.

."brush: bash"
    curl -i http://github.com/api/v2/xml/user/show/jverkoey

And the corresponding output:

."brush: xml"
    <user>
      <name>Jeff Verkoeyen</name>
      <company></company>
      <location>San Francisco</location>
      <created-at type="datetime">2009-01-10T17:18:44-08:00</created-at>
      <public-gist-count type="integer">0</public-gist-count>
      <public-repo-count type="integer">6</public-repo-count>
      <blog>http://JeffVerkoeyen.com/</blog>
      <following-count type="integer">0</following-count>
      <id type="integer">45670</id>
      <followers-count type="integer">4</followers-count>
      <login>jverkoey</login>
      <email>jverkoey@gmail.com</email>
    </user>

<div class="sectiontags" markdown="1">
* UserModel.m
* Additions
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)setActivePropertyKey:(NSString*)activePropertyKey type:(NSString*)type {
      NSString* keyCopy = [activePropertyKey copy];
      [_activePropertyKey release];
      _activePropertyKey = keyCopy;

      NSString* typeCopy = [type copy];
      [_activePropertyType release];
      _activePropertyType = typeCopy;
    }

    - (void)parser:          (NSXMLParser*)parser
            didStartElement: (NSString*)elementName
               namespaceURI: (NSString*)namespaceURI
              qualifiedName: (NSString*)qName
                 attributes: (NSDictionary*)attributeDict {
      if( ![elementName isEqualToString:@"user"] ) {
        [self setActivePropertyKey: elementName
                              type: [attributeDict objectForKey:@"type"]];
      }
    }

    - (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
      if( nil != _activePropertyKey ) {
        NSString* property = [_properties objectForKey:_activePropertyKey];
        if( nil == property ) {
          property = [[NSString alloc] init];
          [_properties setObject:property forKey:_activePropertyKey];
          [property release];
        }

        [_properties setObject: [property stringByAppendingString:string]
                        forKey: _activePropertyKey];
      }
    }

    - (void)parser:        (NSXMLParser *)parser
            didEndElement: (NSString *)elementName
             namespaceURI: (NSString *)namespaceURI
            qualifiedName: (NSString *)qName {
      if( nil != _activePropertyKey && nil != _activePropertyType ) {
        if( [_activePropertyType isEqualToString:@"integer"] ) {
          NSString* property = [_properties objectForKey:_activePropertyKey];
          [_properties setObject: [NSNumber numberWithInt:[property intValue]]
                          forKey: _activePropertyKey];

        } else if( [_activePropertyType isEqualToString:@"datetime"] ) {
          NSString* property = [_properties objectForKey:_activePropertyKey];

          NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
          [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
          [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];

          NSDate* date = [dateFormatter dateFromString:property];
          TT_RELEASE_SAFELY(dateFormatter);

          [_properties setObject:date forKey:_activePropertyKey];
        }
      }

      [self setActivePropertyKey:nil];
    }

This code is pretty bulky right now. It should be pretty easy to tell where we can pull out common
code and create a more general purpose XML parser, but we'll get to that later.

Now that we've parsed the data, let's check the output from UserDataSource.

<div class="sectiontags" markdown="1">
* UserDataSource.m
* Testing
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)tableViewDidLoadModel:(UITableView*)tableView {
      NSMutableArray* sections = [[NSMutableArray alloc] init];
      NSMutableArray* items = [[NSMutableArray alloc] init];

      NSLog(@"Properties: %@", _usermodel.properties);
      ...

You should see something like:

    Properties: {
        blog = "http://JeffVerkoeyen.com/";
        "created-at" = 2009-01-10 17:18:44 -0800;
        email = "jverkoey@gmail.com";
        "followers-count" = 4;
        "following-count" = 0;
        id = 45670;
        location = "San Francisco";
        login = jverkoey;
        name = "Jeff Verkoeyen";
        "public-gist-count" = 0;
        "public-repo-count" = 6;
    }

[Continue this tutorial on page 3...](/tutorials/githubpage3)
