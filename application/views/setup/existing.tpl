<?= $this->pageTitle() ?>
=========================
<div class="source">Source: <a href="http://github.com/facebook/three20">github</a></div>

Starting a new project with three20?  
Skip these steps with the [three20 project templates](/setup/templates).

Three20 is compiled as a static library and the easiest way to add it to your project is to use
Xcode's "dependent project" facilities. Here's how:

* Clone the three20 git repository:  
  `git clone git://github.com/facebook/three20.git`
* Locate the "Three20.xcodeproj" file under "three20/src".  Drag Three20.xcodeproj and drop it onto
  the root of your Xcode project's "Groups and Files"  sidebar.  A dialog will appear -- make sure 
  "Copy items" is unchecked and "Reference Type" is "Relative to Project" before clicking "Add".
  <div class="image" markdown=1>![Add to existing project](/gfx/setup/existing/addtoproject.png 380x156)</div>

* Now you need to link the Three20 static library to your project.  Click the "Three20.xcodeproj" 
  item that has just been added to the sidebar.  Under the "Details" table, you will see a single
  item: libThree20.a.  Check the checkbox on the far right of libThree20.a.
  <div class="image" markdown=1>![Link the static library](/gfx/setup/existing/linkit.png 306x34)</div>

* Now you need to add Three20 as a dependency of your project, so Xcode compiles it whenever
  you compile your project.  Expand the "Targets" section of the sidebar and double-click your
  application's target.  Under the "General" tab you will see a "Direct Dependencies" section. 
  Click the "+" button, select "Three20", and click "Add Target".
  <div class="image" markdown=1>![Add three20 as a dependency](/gfx/setup/existing/dependency.png 316x119)</div>

* Now you need to add the bundle of images and strings to your app.  Locate "Three20.bundle" under
  "three20/src" and drag and drop it into your project.  A dialog will appear -- make sure 
  "Create Folder References" is selected,  "Copy items" is unchecked, and "Reference Type" is 
  "Relative to Project" before clicking "Add".
  <div class="image" markdown=1>![Add the three20 bundle](/gfx/setup/existing/bundle.png 389x162)</div>

* Now you need to add the Core Animation framework to your project.  Right click on the
  "Frameworks" group in your project (or equivalent) and select Add > Existing Frameworks. 
  Then locate QuartzCore.framework and add it to the project.
* Finally, we need to tell your project where to find the Three20 headers.  Open your
  "Project Settings" and go to the "Build" tab. Be sure to select the appropriate active configuration 
  (eg, Release vs. Debug -- eventually you'll need to change both). Look for "Header Search Paths" and 
  double-click it.  Add the relative path from your project's directory to the "three20/src" directory. 
  If your project and the three20 source are in the same parent, you would enter
  "../three20/src".
* While you are in Project Settings, go to "Other Linker Flags" under the "Linker" section, and
  add "-ObjC" and "-all_load" to the list of flags.
* You're ready to go.  Just `#import "Three20/Three20.h"` anywhere you want to use Three20 classes
  in your project.
