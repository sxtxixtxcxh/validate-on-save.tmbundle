class VOS
  class Validate
    def self.erb
      ruby_bin = ENV['TM_RUBY'] ||= "ruby"
      erb_bin = ENV["TM_ERB"] ||= "erb"
      VOS.output({
        :info => `"#{ruby_bin}" -e'puts "Running syntax check with erb and ruby-" + RUBY_VERSION.to_s'`,
        :result => `"#{erb_bin}" -T - -x | "#{ruby_bin}" -c 2>&1`.gsub(/\-\:([0-9]+)\: /i, 'Line \1: '),
        :match_ok => /Syntax OK/i,
        :match_line => /line (\d+)/i,
        :lang => "Ruby"
      })
    end
  end
end
