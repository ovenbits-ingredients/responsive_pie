What is Responsive Pie?
=============

This is a responsive design template that we can use as a starting point for any of our projects that will have some sort of responsive implementation. This isn't a one size fits all template. But it (hopefully) is a good foundation for most.

This is using serve, so that the designers on our team can get going faster without figuring out rails, etc :)  

This project has compass, for the reset and utilities/mixins, although the latter isn't being used in this implementation yet. That's for you to develop in your specific project (or rip it out if you don't need it). I recommend keeping the reset stuff in there regardless, since the responsive template and grid stylesheets are depending on the reset.  

There is a view helper ruby file that has a lot of the layout helpers configured in there. If you look in the helper file,
you'll see that some things need to be uncommented once this project's contents are permanently living in your rails app (serve doesn't include a lot of the 
rails helpers needed for my helpers to function properly, so they're commented out). It should be pretty self explanatory if you read through the comments in the helper file.  


The stylesheet setup!
=============

Everything in the /modules directory is compass/serve standard. You can mess with some initial mixins, etc in there if you want, but it's easier to leave the /modules directory alone.  

The /partials directory has 3 stylesheets:  
* base
* fluid grid
* grid base  

The **_base.scss** partial has all your standard color/font/background type settings for your page(s).  
The **_fluid_grid.scss** partial has our own 12-column version of the fluid grid system.  
The **_grid_base.scss** partial has the basic non-desktop grid classes for mobile or smaller type devices.  

The only file you should edit out of those 3, is the base file, for setting your initial style variables.  

The root of the stylesheets directory has 3 files:  
* crust
* mobile
* desktop  

The **crust.scss** file has all the declarations of styles and general layouts that your entire app should possess
no matter the type of device (colors, background colors, max-widths, containers/wrappers, fonts, etc). 
One day, we may just merge this will base (but keep the crust filename).  
The **mobile.scss** file has all the mobile specific styles that aren't covered in crust, but that build upon it.  
The **desktop.scss** file has all the desktop styles that are specific to large displays (bigger than mobile), 
but keep in mind that crust and mobile are still loaded in first. So the desktop file builds upon those.


_now for some of the standard serve stuff_  


How do I install and run Serve?
-------------------------------

Serve is distributed as a Ruby gem to make it easy to get up and running. You
must have Ruby installed in order to download and use Serve. The Ruby download
page provides instructions for getting Ruby setup on different platforms:  
<http://www.ruby-lang.org/en/downloads/>

After you have Ruby installed, open up the command prompt and type:

    gem install serve

(OSX and Unix users may need to prefix the command with `sudo`.)

After Serve is installed, you can start it up in a given directory like this:

    serve

This will start Serve on port 4000. You can now view the prototype in your
Web browser at this URL:

<http://localhost:4000>


Learning More
-------------

You can learn more about Serve on the GitHub project page:  
<http://github.com/jlong/serve>