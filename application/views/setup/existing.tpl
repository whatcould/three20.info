<h1><?= $this->pageTitle() ?></h1>
<div class="source">Source: <a href="http://github.com/facebook/three20">github</a></div>

<p>Three20 is compiled as a static library and the easiest way to add it to your project is to use
  Xcode's "dependent project" facilities. Here's how:</p>

<ol>
  <li>Clone the three20 git repository:<br/>
   <span class="inline">git clone git://github.com/facebook/three20.git</span><br/></li>

  <li>Locate the "Three20.xcodeproj" file under "three20/src".  Drag Three20.xcodeproj and drop it onto
   the root of your Xcode project's "Groups and Files"  sidebar.  A dialog will appear -- make sure 
   "Copy items" is unchecked and "Reference Type" is "Relative to Project" before clicking "Add".
   <div class="image"><img src="/gfx/setup/existing/addtoproject.png" width="380" height="156" alt="Add to existing project"/></div>
   </li>

  <li>Now you need to link the Three20 static library to your project.  Click the "Three20.xcodeproj" 
   item that has just been added to the sidebar.  Under the "Details" table, you will see a single
   item: libThree20.a.  Check the checkbox on the far right of libThree20.a.
   <div class="image"><img src="/gfx/setup/existing/linkit.png" width="306" height="34" alt="Link the static library"/></div>
   </li>

  <li>Now you need to add Three20 as a dependency of your project, so Xcode compiles it whenever
   you compile your project.  Expand the "Targets" section of the sidebar and double-click your
   application's target.  Under the "General" tab you will see a "Direct Dependencies" section. 
   Click the "+" button, select "Three20", and click "Add Target".
   <div class="image"><img src="/gfx/setup/existing/dependency.png" width="316" height="119" alt="Add three20 as a dependency"/></div>
   </li>

  <li>Now you need to add the bundle of images and strings to your app.  Locate "Three20.bundle" under
   "three20/src" and drag and drop it into your project.  A dialog will appear -- make sure 
   "Create Folder References" is selected,  "Copy items" is unchecked, and "Reference Type" is 
   "Relative to Project" before clicking "Add".
   <div class="image"><img src="/gfx/setup/existing/bundle.png" width="389" height="162" alt="Add the three20 bundle"/></div>
   </li>

  <li>Now you need to add the Core Animation framework to your project.  Right click on the
   "Frameworks" group in your project (or equivalent) and select Add > Existing Frameworks. 
   Then locate QuartzCore.framework and add it to the project.</li>

  <li>Finally, we need to tell your project where to find the Three20 headers.  Open your
   "Project Settings" and go to the "Build" tab. Look for "Header Search Paths" and double-click
   it.  Add the relative path from your project's directory to the "three20/src" directory.</li>

  <li>While you are in Project Settings, go to "Other Linker Flags" under the "Linker" section, and
   add "-ObjC" and "-all_load" to the list of flags.</li>

  <li>You're ready to go.  Just <span class="inline">#import "Three20/Three20.h"</span> anywhere you want to use Three20 classes
   in your project.</li>

</ol>
