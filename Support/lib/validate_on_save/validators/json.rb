class VOS
  class Validate
    def self.json
      filename = ENV['TM_FILENAME']
      filepath = ENV['TM_FILEPATH']
      binary   = ENV['TM_JSONLINT'] || 'jsonlint'

      info = `echo Running syntax check with jsonlint-$("#{binary}" --version)`

      result = `"#{binary}" "#{filepath}" --compact --quiet 2>&1`.gsub("#{filepath}: ", '')
      result = VOS.htmlify_results(result, filepath)

      VOS.output({
        :info => info,
        :result => result.chomp,
        :match_ok => /^$/,
        :match_line => /line (\d+)/i,
        :lang => "JSON"
      })
    end
  end
end