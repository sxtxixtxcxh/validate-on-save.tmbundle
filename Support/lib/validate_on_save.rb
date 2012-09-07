require ENV['TM_SUPPORT_PATH'] + "/lib/textmate"
ENV['PATH'] += ":#{ENV['TM_BUNDLE_SUPPORT']}/bin"

$LOAD_PATH << ENV['TM_BUNDLE_SUPPORT'] + "/lib"

require "validate_on_save/constantize"
require "validate_on_save/defaults"
require "validate_on_save/trim"
require "validate_on_save/validators"

#
# Internal constants
#

GROWL_BIN = ENV["TM_GROWLNOTIFY"] ||= ENV["TM_BUNDLE_SUPPORT"] + "/bin/growlnotify"


#
# Main VOS Class
#

class VOS
  
  #
  # Main methods
  #
  
  def self.validate
    scope = ENV["TM_SCOPE"]
    scopes = {
      :coffeescript => { :is => /source\.coffee/ },
      :css => { :is => /source\.css/ },
      :erlang => { :is => /source\.erlang/ },
      :haml => { :is => /text\.haml/ },
      :javascript => { :is => /source\.js|source\.prototype\.js/, :not => /source\.js\.embedded\.html/ },
      :php => { :is => /source\.php/ },
      :python => { :is => /source\.python/ },
      :erb => { :is => /text\.html\.ruby|text\.html source\.ruby/ },
      :ruby => { :is => /source\.ruby/, :not => /source\.ruby\.embedded/|/source\.ruby\.embedded.haml/|/text\.html\.ruby/ },
      :sass => { :is => /source\.sass/ },
      :json => { :is => /source\.json/ }
    }
    scopes.each do |lang, match|
      if scope =~ match[:is] && (!match.has_key?(:not) || !(scope =~ match[:not]))
        Validate.send(lang)
        break
      end
    end
  end
  
  def self.output(options = {})
    info = options[:info] ||= ""
    info = "" if !opt("VOS_VALIDATOR_INFO")
    result = options[:result] ||= ""
    match_ok = options[:match_ok] ||= ""
    match_line = options[:match_line] ||= ""
    lang = options[:lang] ||= ""
    result_mod = options[:result_mod] ||= ""

    if result =~ match_ok
      if !opt("VOS_ONLY_ON_ERROR")
        puts info + "Syntax OK" if opt("VOS_TM_NOTIFY")
        `"#{GROWL_BIN}" -p 'Low' -m 'Syntax OK' -n 'Textmate Syntax Check' -t "#{lang} Syntax Check" -a "Textmate"` if opt("VOS_GROWL")
      end
    else
      yield(result) if block_given?
      puts info + result if opt("VOS_TM_NOTIFY")
      `cat <<-EOT | "#{GROWL_BIN}" -p 'Emergency' -n 'Textmate Syntax Check' -t "#{lang} Syntax Check" -a "Textmate"
      #{result}` if opt("VOS_GROWL")
      TextMate.go_to :line => $1 if result =~ match_line && opt("VOS_JUMP_TO_ERROR")
    end
  end
  
  #
  # Util methods
  #
  
  def self.opt(key)
    if ENV.has_key?(key)
      return (ENV[key] == "true") ? true : false
    else
      return key.constantize
    end
  end
  
  def self.bugreport()
    require "#{ENV['TM_SUPPORT_PATH']}/lib/browser"
    Browser.load_url('http://github.com/sxtxixtxcxh/validate-on-save.tmbundle/issues')
  end
  
end
