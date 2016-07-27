class VOS
  class Validate
    def self.ruby_select
      if ENV["VOS_RUBY_RUBOCOP"]
        rubocop
      else
        ruby
      end
    end

    def self.ruby
      ruby_bin = ENV['TM_VOS_RUBY'] || ENV['TM_RUBY'] || "ruby"
      VOS.output({
        :info => `"#{ruby_bin}" -e'puts "Running syntax check with ruby-" + RUBY_VERSION.to_s'`,
        :result => `"#{ruby_bin}" -wc 2>&1`.gsub(/\-\:([0-9]+)\: /i, 'Line \1: '),
        :match_ok => /(?<!\n)Syntax OK/im,
        :match_line => /line (\d+)/i,
        :lang => "Ruby"
      })
    end

    def self.rubocop
      rubocop_bin = ENV['TM_RUBOCOP'] || "rubocop"
      filepath = ENV["TM_FILEPATH"]
      VOS.output({
        :info => `echo Running syntax check with rubocop-$("#{rubocop_bin}" --version)`,
        :result => `"#{rubocop_bin}" --format clang "#{filepath}"`,
        :match_ok => /(no|0) offenses/,
        :match_line => /\S+:(\d+):\d+: /,
        :lang => "Ruby"
      })
    end
  end
end
