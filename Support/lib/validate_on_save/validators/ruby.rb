class VOS
  class Validate
    def self.ruby
      ruby_bin = ENV['TM_RUBY'] ||= "ruby"
      VOS.output({
        :info => `"#{ruby_bin}" -e'puts "Running syntax check with ruby-" + RUBY_VERSION.to_s'`,
        :result => `"#{ruby_bin}" -wc 2>&1`.gsub(/\-\:([0-9]+)\: /i, 'Line \1: '),
        :match_ok => /Syntax OK/i,
        :match_line => /line (\d+)/i,
        :lang => "Ruby"
      })
    end
  end
end
