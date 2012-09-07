class VOS
  class Validate
    def self.json
      filename = ENV['TM_FILENAME']
      filepath = ENV['TM_FILEPATH']
      binary   = ENV['TM_JSONLINT'] || 'jsonlint'
      VOS.output({
        :info => "Running syntax check with jsonlint\n",
        :result => `"#{binary}" #{filepath} --compact --quiet 2>&1`.gsub("#{filepath}: ", ''),
        :match_ok => /^$/i,
        :match_line => /line (\d+)/i,
        :lang => "JSON"
      })
    end
  end
end