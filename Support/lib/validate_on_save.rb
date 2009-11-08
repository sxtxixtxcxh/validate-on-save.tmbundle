require ENV['TM_BUNDLE_SUPPORT'] + "/conf/validate_on_save.config"


def validate_on_save(options = {})
  info = options[:info] ||= ""
  info = "" if !VOS_VALIDATOR_INFO
  result = options[:result] ||= ""
  match_ok = options[:match_ok] ||= ""
  match_line = options[:match_line] ||= ""
  lang = options[:lang] ||= ""
  result_mod = options[:result_mod] ||= ""
  
  
  if result =~ match_ok
    if !VOS_ONLY_ON_ERROR
      puts info + "Syntax OK" if VOS_TM_NOTIFY
      `#{VOS_GROWL_BIN} -p 'Low' -m 'Syntax OK' -n 'Textmate Syntax Check' -t "#{lang} Syntax Check" -a "Textmate"` if VOS_GROWL
    end
  else
    yield(result) if block_given?
    puts info + result if VOS_TM_NOTIFY
    `#{VOS_GROWL_BIN} -p 'Emergency' -m '#{result}' -n 'Textmate Syntax Check' -t "#{lang} Syntax Check" -a "Textmate"` if VOS_GROWL
    TextMate.go_to :line => $1 if result =~ match_line
  end
end
