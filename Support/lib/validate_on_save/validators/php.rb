class VOS
  class Validate
    def self.php
      php_bin = ENV['TM_PHP'] ||= "php"
      VOS.output({
        :info => "Running syntax check with " + %x{'php' -v}.split[0..2].join(' ') + "\n",
        :result => `"#{php_bin}" -d display_errors=on -l`.gsub('in -', ''),
        :match_ok => /^No syntax errors detected/i,
        :match_line => /line (\d+)/i,
        :lang => "PHP"
      })
    end
  end
end
