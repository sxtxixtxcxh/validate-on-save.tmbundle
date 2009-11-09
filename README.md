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

Follow these instructions if you have Git installed:

    $ cd ~/Library/Application\ Support/TextMate/Bundles/
    $ git clone git://github.com/sxtxixtxcxh/validate-on-save.tmbundle.git "Validate On Save.tmbundle"
    $ osascript -e 'tell app "TextMate" to reload bundles'
    
Installing via Git will allow you to keep up to date with the `Bundles` > `Validate On Save` > `Update Bundle` menu command.

If you don't have Git and downloaded this from Github (really? you don't have Git?), after you've unzipped or untarred, you'll have to rename the folder from `sxtxixtxcxh-validate-on-save.tmbundle-#{HASH}` to `Validate On Save.tmbundle`. Double click and TextMate should install it for you.


Configuration
-------------

You can customize how and when VOS (Validate On Save) notifies you. This is done by setting Shell Variables in TextMate (`Textmate` > `Preferences` > `Advanced` > `Shell Variables`).

All variables starting with `VOS_` take values of either "true" or "false".

*  `VOS_VALIDATOR_INFO`: Outputs information about the validator. (defaults to "false")
*  `VOS_ONLY_ON_ERROR`: Only displays notifications on syntax error. Useful if you don't want to be told repeatedly that everything is OK. (defaults to "false")
*  `VOS_TM_NOTIFY`: Display the validation result in a TextMate tooltip. If you use Growl, you might want to disable this. (defaults to "true")
*  `VOS_GROWL`: Use Growl to display the validation result. (defaults to "true")
*  `VOS_JUMP_TO_ERROR`: When a error is found, automatically move the cursor to the line causing the problem. (defaults to "false")
*  `TM_COMPASS`: If you get an error saying "compass not found" during Compass validation, run `which compass` in a terminal, and put the result as the value of this option to make VOS find your compass binary.
* `TM_GROWLNOTIFY`: VOS includes the `growlnotify` binary, but if for some reason the included one does not work, you can use this option to specify the path to your own.


Updating
--------

If you installed via the recommended method above by running `git clone...`, you can easily update the bundle via `Bundles` > `Validate On Save` > `Update Bundle`.


Caveats
-------

This is a very early release, so it *might* not work out so well for you. Feel free to let me know at [sxtxixtxcxh@gmail.com](mailto:sxtxixtxcxh@gmail.com).

### Compass Validation

The Compass "validation" actually compiles your SASS files and returns any errors or warnings. 

If you are using a standalone Compass project, it depends on being able to find your config.rb file in either the same directory as your SASS files *or* in one any of the parent directories. 

If you're using Compass with Rails it runs `compass --update` on your Rails root directory, as determined by the parent of the "app" or "public" directory. This means your SASS files must be descendants of one of those directories. Compass, by default, installs into #{RAILS_ROOT}/app/stylesheets/

### CSS Validation

CSS validation is done locally using w3c.org's Jigsaw server. This means it's essentially booting up a java based web server, so it can be relatively slow.

### Licenses

  * JavaScript Lint Based on SpiderMonkey, which is licensed under the MPL/GPL/LGPL tri-license
