What is this?
=============

This is a responsive design template that we can use as a starting point for our projects that will have some sort of responsive implementation.  

This is using serve, so that the designers on our team can get going faster without figuring out rails, etc :)  

This project has compass, for the reset and utilities/mixins, although the latter isn't be used in this implementation yet. That's for you to develop in your specific project (or rip it out if you don't need it). I recommend keeping the reset stuff in there, regardless, since the responsive template and grid stylesheets are depending on the reset.  

There is a view helper ruby file that has a lot of the layout helpers configured in there. If you look in the helper file,
you'll see that some things need to be uncommented once this project's contents are permanently living in your rails app (serve doesn't include a lot of the 
rails helpers needed for my helpers to function properly, so they're commented out). It should be pretty self explanatory if you read through the comments in the helper file.


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
