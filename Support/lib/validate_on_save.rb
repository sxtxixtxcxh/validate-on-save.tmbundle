require ENV['TM_SUPPORT_PATH'] + "/lib/textmate"

$LOAD_PATH << ENV['TM_BUNDLE_SUPPORT'] + "/lib"

require "validate_on_save/constantize"
require "validate_on_save/defaults"
require "validate_on_save/output"
require "validate_on_save/validate"

#
# Internal constants
#

GROWL_BIN = ENV["TM_GROWLNOTIFY"] ||= ENV["TM_BUNDLE_SUPPORT"] + "/bin/growlnotify"


#
# Main VOS Class
#

class VOS
  
  def self.opt(key)
    if ENV.has_key?(key)
      return (ENV[key] == "true") ? true : false
    else
      return key.constantize
    end
  end
  
end
