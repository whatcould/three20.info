How to build a GitHub iPhone app with three20
=============================================

<div class="source">
  <a href="/tutorials/githubintro">Intro</a> -
  <a href="/tutorials/githubpage2">User Model</a> -
  User View
</div>

By now your app should be making a request to the github api server, receiving the data, and parsing
the xml into an NSDictionary. Let's turn that data into something visual.

Let's shoot for mimicking the GitHub UI while still retaining the look and feel of the iPhone UI.

Here's what the current GitHub UI looks like:

<div class="image" markdown=1>![The GitHub UI](/gfx/tutorial/github/githubui.png 500x115)</div>

And here's our goal for the end of this section:

<div class="image" markdown=1>![The User Info UI](/gfx/tutorial/github/finaluserui.png 320x480)</div>

Let's start by adding the key-value pairs below the header in the GitHub user view.

Start by opening the `UserDataSource.m` file. This is where we are going to take the data retrieved
by the model and turn it into a set of table items. Our `UserDataSource` object implements the
`TTSectionedDataSource` object which allows us to create sectioned blocks of information in the
table. Let's create the first section.

<div class="sectiontags" markdown="1">
* UserDataSource.m
* Additions
</div>
<div class="clearfix"></div>

."brush: obj-c"
    - (void)tableViewDidLoadModel:(UITableView*)tableView {
      NSMutableArray* sections = [[NSMutableArray alloc] init];
      NSMutableArray* items = [[NSMutableArray alloc] init];

      {
        // This section has no title.
        [sections addObject:@""];

        NSMutableArray* itemRows = [[NSMutableArray alloc] init];

        NSString* name = [_usermodel.properties objectForKey:@"name"];
        NSString* email = [_usermodel.properties objectForKey:@"email"];
        NSString* company = [_usermodel.properties objectForKey:@"company"];
        NSString* blog = [_usermodel.properties objectForKey:@"blog"];
        NSString* location = [_usermodel.properties objectForKey:@"location"];
        NSDate* memberSince = [_usermodel.properties objectForKey:@"created-at"];

        if( !TTIsEmptyString(email) ) {
          [itemRows addObject:[TTTableCaptionItem itemWithText:email
                                                  caption:@"Email"]];
        }

        if( !TTIsEmptyString(blog) ) {
          [itemRows addObject:[TTTableCaptionItem
            itemWithText: [[blog
                          stringByReplacingOccurrencesOfString:@"http://"
                            withString:@""]
                          stringByTrimmingCharactersInSet:[NSCharacterSet
                            characterSetWithCharactersInString:@"/"]]
                 caption: @"Website/Blog"
                     URL: blog]];
        }

        if( !TTIsEmptyString(company) ) {
          [itemRows addObject:[TTTableCaptionItem itemWithText:company
                                                  caption:@"Company"]];
        }

        if( !TTIsEmptyString(location) ) {
          [itemRows addObject:[TTTableCaptionItem itemWithText:location
                                                  caption:@"Location"]];
        }

        if( nil != memberSince ) {
          NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
          formatter.dateFormat = @"LLLL d, YYYY";
          [itemRows addObject:[TTTableCaptionItem
            itemWithText: [formatter stringFromDate:memberSince]
                 caption: @"Member Since"]];
          TT_RELEASE_SAFELY(formatter);
        }

        [items addObject:itemRows];
        TT_RELEASE_SAFELY(itemRows);
      }

      self.sections = sections;
      self.items = items;

      TT_RELEASE_SAFELY(sections);
      TT_RELEASE_SAFELY(items);
    }

Build and run the app, and you should see something like this:

<div class="image" markdown=1>![The First Iteration of the User Info UI](/gfx/tutorial/github/userui1.png 320x480)</div>

Now let's add the header. We're going to use three20's TTStyle framework to attempt to mimic
the border around the user profile seen on GitHub.com.

GitHub uses gravatar for the user profile pictures. Gravatar dishes out URLs using an md5 hash of
the user's email address. Thankfully three20 comes with an md5 addition that we can use to
generate this hash.

Before we continue, you'll want to add the placeholder image GitHub uses if the user has no
gravatar.

<div class="image" markdown=1>![Gravatar Placeholder](http://github.com/images/gravatars/gravatar-48.png 48x48)</div>

Add this image to your project and it should automatically be copied into the target.

Now let's get to the code. Add this just before the name row.

<div class="sectiontags" markdown="1">
* UserDataSource.m
* Additions
</div>
<div class="clearfix"></div>

."brush: obj-c"
    if( !TTIsEmptyString(email) ) {
      NSData* emailData = [email dataUsingEncoding:NSUTF8StringEncoding];

      NSString* imageUrl = [@"http://www.gravatar.com/avatar/"
        stringByAppendingString:[emailData md5Hash]];

      TTStyle* style = 
        [TTShapeStyle styleWithShape:[TTRectangleShape shape] next:
        [TTSolidBorderStyle styleWithColor:[UIColor colorWithWhite:0.86 alpha:1]
                            width:1 next:
        [TTInsetStyle styleWithInset:UIEdgeInsetsMake(2, 2, 2, 2) next:
        [TTContentStyle styleWithNext:
        [TTImageStyle styleWithImageURL:nil
                      defaultImage:nil
                      contentMode:UIViewContentModeScaleAspectFill
                      size:CGSizeMake(50, 50) next:nil]]]]];

      [itemRows addObject:[TTTableImageItem
        itemWithText: name
            imageURL: imageUrl
        defaultImage: TTIMAGE(@"bundle://gravatar-48.png")
          imageStyle: style
                 URL: nil]];
    }

<div class="image" markdown=1>![The Second Iteration of the User Info UI](/gfx/tutorial/github/userui2.png 320x480)</div>

The last step is to add another section for the user statistics.

<div class="sectiontags" markdown="1">
* UserDataSource.m
* Additions
</div>
<div class="clearfix"></div>

."brush: obj-c"
    {
      [sections addObject:@"Stats"];

      NSMutableArray* itemRows = [[NSMutableArray alloc] init];

      NSNumber* publicRepoCount = [_usermodel.properties
        objectForKey:@"public-repo-count"];
      if( nil != publicRepoCount ) {
        [itemRows addObject:[TTTableTextItem
          itemWithText: [NSString stringWithFormat:@"%d public repos",
                          [publicRepoCount intValue]]]];
      }

      NSNumber* followersCount = [_usermodel.properties objectForKey:@"followers-count"];
      if( nil != followersCount ) {
        [itemRows addObject:[TTTableTextItem
          itemWithText: [NSString stringWithFormat:@"%d followers",
                          [followersCount intValue]]]];
      }

      NSNumber* followingCount = [_usermodel.properties objectForKey:@"following-count"];
      if( nil != followingCount ) {
        [itemRows addObject:[TTTableTextItem
          itemWithText: [NSString stringWithFormat:@"Following %d githubbers",
                          [followingCount intValue]]]];
      }

      [items addObject:itemRows];

      TT_RELEASE_SAFELY(itemRows);
    }

<div class="image" markdown=1>![The Third Iteration of the User Info UI](/gfx/tutorial/github/userui3.png 320x480)</div>
