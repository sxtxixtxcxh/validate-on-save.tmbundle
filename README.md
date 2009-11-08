Validate On Save
================

Hey! Remember:

  1. Saving.
  2. Switching to your browser.
  3. Refreshing.
  4. Finding out you had a syntax error in your source code.
  5. Switching back to TextMate.
  6. Fixing the error.
  7. Saving.
  8. Switching back to the browser.
  9. Refreshing?

This bundle lets you skips several of those steps.


Supported Languages
-------------------

  * Ruby
  * PHP
  * CSS
  * JavaScript
  * Compass (still a bit buggy)

Installation
------------

    $ cd ~/Library/Application\ Support/TextMate/Bundles/
    $ git clone git://github.com/sxtxixtxcxh/validate-on-save.tmbundle.git "Validate On Save.tmbundle"
    $ osascript -e 'tell app "TextMate" to reload bundles'

Configuration
-------------

You can edit some basic output/notification options via `Bundles` > `Validate On Save` > `Edit Configuration File`. Changes might or might not remain after updating the bundle, I don't know yet.

Growl notifications use the growlnotify command line tool, which is available as an Extra on the Growl DMG image.


Caveats
-------

This is a very early release, so it *might* not work out so well for you. Feel free to let me know at [sxtxixtxcxh@gmail.com](mailto:sxtxixtxcxh@gmail.com).

### Compass

The Compass "validation" actually compiles your SASS files and returns any errors or warnings. 

If you are using a standalone Compass project, it depends on being able to find your config.rb file in either the same directory as your SASS files *or* in one any of the parent directories. 

If you're using Compass with Rails it runs compass --update on your Rails root directory (as determined by the parent of the "app" directory).
