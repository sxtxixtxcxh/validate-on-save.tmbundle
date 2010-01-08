class VOS
  class Validate
    def self.erlang
      erlc_bin = ENV['TM_ERLC'] ||= "erlc"
      tmp = VOS.opt("VOS_ERL_OUTPUT_TO_TMP")
      output = (tmp) ? "-o /tmp" : ""
      VOS.output({
        :info => "",
        :result => `"#{erlc_bin}" #{output} "#{ENV['TM_FILEPATH']}"`,
        :match_ok => /^$/i,
        :match_line => /.*?#{Regexp.escape(ENV['TM_FILENAME'])}\:(\d+)\:.*/i,
        :lang => "Erlang"
      })
      beam_file = ENV['TM_FILENAME'].gsub(/\.([a-z0-9]+)$/i, ".beam")
      `rm /tmp/#{beam_file}` if tmp && File.exist?("/tmp/#{beam_file}")
    end
  end
end
