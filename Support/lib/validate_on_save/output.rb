class VOS

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
  
end