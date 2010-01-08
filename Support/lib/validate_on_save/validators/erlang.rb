class VOS
  class Validate
    def self.erlang
      erlc_bin = ENV['TM_ERLC'] ||= "erlc"
      VOS.output({
        :info => "",
        :result => `"#{erlc_bin}" "#{ENV['TM_FILEPATH']}"`,
        :match_ok => /^$/i,
        :match_line => /.*?#{Regexp.escape(ENV['TM_FILENAME'])}\:(\d+)\:.*/i,
        :lang => "Erlang"
      })
    end
  end
end
