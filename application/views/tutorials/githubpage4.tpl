How to build a GitHub iPhone app with three20
=============================================

<div class="source">
  <a href="/tutorials/githubintro">Intro</a> -
  <a href="/tutorials/githubpage2">User Model</a> -
  <a href="/tutorials/githubpage3">User View</a> -
  User Search
</div>


<div class="sectiontags" markdown="1">
* UserSearchViewController.h
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @interface UserSearchViewController : TTViewController {
    }

    @end


<div class="sectiontags" markdown="1">
* UserSearchViewController.m
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @implementation UserSearchViewController

    - (id)init {
      if (self = [super init]) {
        self.title = @"User Search";
      }

      return self;
    }

    @end

<div class="sectiontags" markdown="1">
* AppDelegate.m
* Modifications
</div>
<div class="clearfix"></div>

."brush: obj-c"
    ...
    
    #import "UserSearchViewController.h"
    
    ...
    
    [map from:@"gh://usersearch"
         toViewController:[UserSearchViewController class]];

     if (![navigator restoreViewControllers]) {
       [navigator openURL:@"gh://usersearch" animated:NO];
     }


<div class="image" markdown=1>![User Search](/gfx/tutorial/github/usersearch1.png 320x480)</div>

<div class="sectiontags" markdown="1">
* UserSearchModel.h
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @interface UserSearchModel : TTURLRequestModel {
      NSString*       _searchText;
      NSMutableArray* _results;

      NSTimer*        _timer;
    }

    @property (nonatomic, copy)     NSString* searchText;
    @property (nonatomic, readonly) NSArray*  results;

    @end

<div class="sectiontags" markdown="1">
* UserSearchModel.m
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    static NSTimeInterval kSearchDelay = 0.3;

    @implementation UserSearchModel

    @synthesize searchText = _searchText;
    @synthesize results    = _results;

    - (void)dealloc {
      TT_RELEASE_SAFELY(_searchText);
      TT_RELEASE_SAFELY(_results);

      [super dealloc];
    }

    - (void)search {
      NSString* url = [NSString
        stringWithFormat:@"http://github.com/api/v2/xml/user/search/%@",
        [_searchText stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];

      TTURLRequest* request = [TTURLRequest
        requestWithURL: url
              delegate: self];

      request.cachePolicy = TTURLRequestCachePolicyNetwork | TTURLRequestCachePolicyNoCache;

      id<TTURLResponse> response = [[TTURLDataResponse alloc] init];
      request.response = response;
      TT_RELEASE_SAFELY(response);

      [request send];
    }

    - (void)searchTimer {
      _timer = nil;
      [self search];
    }

    - (void)setSearchText:(NSString*)text {
      if( ![_searchText isEqualToString:text] ) {
        NSString* copy = [text copy];
        [_searchText release];
        _searchText = copy;
        [self load:TTURLRequestCachePolicyNetwork more:NO];
      }
    }

    - (BOOL)isLoading {
      return _timer || [super isLoading];
    }

    - (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
      TT_INVALIDATE_TIMER(_timer);
      [self cancel];

      if( 0 == _searchText.length ) {
        if( _results ) {
          TT_RELEASE_SAFELY(_results);
          [_delegates perform:@selector(modelDidChange:) withObject:self];
        }
      } else {
        _isLoadingMore = more;
        _timer = [NSTimer scheduledTimerWithTimeInterval:kSearchDelay
          target:self selector:@selector(searchTimer) userInfo:nil repeats:NO];
        [self didStartLoad];
      }
    }

    @end

<div class="sectiontags" markdown="1">
* UserSearchDataSource.h
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    @class UserSearchModel;

    @interface UserSearchDataSource : TTListDataSource {
      UserSearchModel* _searchModel;
    }

    @property (nonatomic, retain) UserSearchModel* searchModel;

    @end

<div class="sectiontags" markdown="1">
* UserSearchDataSource.m
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    #import "UserSearchModel.h"

    @implementation UserSearchDataSource

    @synthesize searchModel = _searchModel;

    - (id)init {
      if( self = [super init] ) {
        UserSearchModel* searchModel = [[UserSearchModel alloc] init];
        self.searchModel = searchModel;
        TT_RELEASE_SAFELY(searchModel);
      }

      return self;
    }

    - (void)dealloc {
      TT_RELEASE_SAFELY(_searchModel);

      [super dealloc];
    }

    - (id<TTModel>)model {
      return _searchModel;
    }

    - (void)search:(NSString*)text {
      _searchModel.searchText = text;
    }

    @end

<div class="sectiontags" markdown="1">
* UserSearchViewController.m
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    #import "UserSearchDataSource.h"

    - (void)loadView {
      [super loadView];

      TTTableViewController* searchController = [[TTTableViewController alloc] init];

      UserSearchDataSource* dataSource = [[UserSearchDataSource alloc] init];
      searchController.dataSource = dataSource;
      TT_RELEASE_SAFELY(dataSource);

      searchController.variableHeightRows = YES;

      self.searchViewController = searchController;

      [self.view addSubview:_searchController.searchBar];

      TT_RELEASE_SAFELY(searchController);
    }


<div class="sectiontags" markdown="1">
* UserSearchModel.h
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    NSMutableDictionary*  _activeUser;
    NSString*             _activePropertyKey;
    NSString*             _activePropertyType;

<div class="sectiontags" markdown="1">
* UserSearchModel.m
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)requestDidFinishLoad:(TTURLRequest*)request {
      TTURLDataResponse* response = request.response;

      TT_RELEASE_SAFELY(_results);
      _results = [[NSMutableArray alloc] init];

      NSXMLParser* parser = [[NSXMLParser alloc] initWithData:response.data];
      parser.delegate = self;
      [parser parse];
      TT_RELEASE_SAFELY(parser);

      [super requestDidFinishLoad:request];
    }
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
      if( [elementName isEqualToString:@"users"] ) {
        // Do nothing.

      } else if( [elementName isEqualToString:@"user"] ) {
        NSMutableDictionary* user = [[NSMutableDictionary alloc] init];
        [_results addObject:user];
        _activeUser = user;
        TT_RELEASE_SAFELY(user);

      } else {
        [self setActivePropertyKey:elementName type:[attributeDict objectForKey:@"type"]];
      }
    }

    - (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
      if( nil != _activePropertyKey ) {

        NSString* property = [_activeUser objectForKey:_activePropertyKey];
        if( nil == property ) {
          property = [[NSString alloc] init];
          [_activeUser setObject:property forKey:_activePropertyKey];
          [property release];
        }

        [_activeUser setObject:[property stringByAppendingString:string] forKey:_activePropertyKey];
      }
    }

    - (void)parser:        (NSXMLParser *)parser
            didEndElement: (NSString *)elementName
             namespaceURI: (NSString *)namespaceURI
            qualifiedName: (NSString *)qName {
      if( nil != _activePropertyKey && nil != _activePropertyType ) {
        if( [_activePropertyType isEqualToString:@"integer"] ) {
          NSString* property = [_activeUser objectForKey:_activePropertyKey];
          [_activeUser setObject: [NSNumber numberWithInt:[property intValue]]
                          forKey: _activePropertyKey];

        } else if( [_activePropertyType isEqualToString:@"datetime"] ) {
          NSString* property = [_activeUser objectForKey:_activePropertyKey];

          NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
          [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
          [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];

          NSDate* date = [dateFormatter dateFromString:property];
          TT_RELEASE_SAFELY(dateFormatter);

          [_activeUser setObject:date forKey:_activePropertyKey];
        }
      }

      [self setActivePropertyKey:nil type:nil];

      if( [elementName isEqualToString:@"user"] ) {
        _activeUser = nil;
      }
    }


<div class="sectiontags" markdown="1">
* UserSearchDataSource.m
* New File
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)tableViewDidLoadModel:(UITableView*)tableView {
      NSMutableArray* items = [[NSMutableArray alloc] init];

      for( NSDictionary* user in _searchModel.results ) {

        NSString* username = [user objectForKey:@"username"];
        NSString* fullname = [user objectForKey:@"fullname"];
        NSString* location = [user objectForKey:@"location"];

        [items addObject:[TTTableSubtitleItem
           itemWithText: nil != fullname && !TTIsEmptyString(fullname) ?
                         fullname : username
               subtitle: location
               imageURL: @""
           defaultImage: TTIMAGE(@"bundle://gravatar-48.png")
                    URL: [@"http://github.com/" stringByAppendingString:username]
           accessoryURL: nil]];
      }

      self.items = items;

      TT_RELEASE_SAFELY(items);
    }
