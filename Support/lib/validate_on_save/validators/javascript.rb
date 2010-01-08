class VOS
  class Validate
    def self.javascript
      filename = ENV['TM_FILENAME']
      filepath = ENV['TM_FILEPATH']
      support  = ENV['TM_BUNDLE_SUPPORT']
      binary   = "#{support}/bin/jsl"
      VOS.output({
        :info => "Running syntax check with JavaScript Lint\n",
        :result => `"#{binary}" -process "#{filepath}" -nologo -conf "#{support}/conf/jsl.textmate.conf"`.gsub!(filename, '').strip(),
        :match_ok => /0 error\(s\)\, 0 warning\(s\)/i,
        :match_line => /^(\d+):\s/i,
        :lang => "JavaScript"
      })
    end
  end
end
