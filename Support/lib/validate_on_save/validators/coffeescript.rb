class VOS
  class Validate
    def self.coffeescript
      binary = ENV['TM_COFFEESCRIPT'] ||= "coffee"
      filepath = ENV['TM_FILEPATH']
      VOS.output({
        :info => "Running syntax check with CoffeeScript lint\n",
        :result => `"#{binary}" --lint "#{filepath}" 2>&1`.sub(/^Error.*\.coffee, /, ''),
        :match_ok => /0 error\(s\)\, /i, # ignore warnings
        :match_line => /line (\d+)/i,
        :lang => "CoffeeScript"
      })
    end
  end
end
