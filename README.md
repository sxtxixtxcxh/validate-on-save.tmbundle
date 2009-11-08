Validate On Save
================

Hey! Remember:

  1. saving
  2. switching to your browser
  3. refreshing 
  4. finding out you had a syntax error in your {PHP|Ruby|JavaScript} source code
  5. switching back to TextMate
  6. fixing the error
  7. saving
  8. switching back to the browser
  9. refreshing?

This bundle lets you skips several of those steps.


Supported Languages
-------------------


  * Ruby
  * PHP
  * JavaScript
  * Compass (still a bit buggy) 


Installation
------------

    cd ~/Library/Application\ Support/TextMate/Bundles/;
    
    git clone git://github.com/sxtxixtxcxh/validate-on-save.tmbundle.git Validate\ On\ Save.tmbundle;
    
    osascript -e 'tell app "TextMate" to reload bundles';


Caveats
-------

This is a very early release, so it *might* not work out so well for you. Feel free to let me know at [sxtxixtxcxh@gmail.com](mailto:sxtxixtxcxh@gmail.com).

### Compass

The Compass "validation" actually compiles your SASS files and returns any errors or warnings. 

If you are using a standalone Compass project, it depends on being able to find your config.rb file in either the same directory as your SASS files *or* in one any of the parent directories. 

If you're using Compass with Rails it runs compass --update on your Rails root directory (as determined by the parent of the "app" directory)