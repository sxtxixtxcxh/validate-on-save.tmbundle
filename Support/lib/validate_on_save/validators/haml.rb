class VOS
  class Validate
    def self.haml
      haml = ENV['TM_HAML'] ||= "haml"
      VOS.output({
        :info => "Running syntax check with "+ `#{haml} --version`,
        :result => `"#{haml}" -c 2>&1`,
        :match_ok => /Syntax OK/i,
        :match_line => /line (\d+)/i,
        :lang => "Haml"
      })
    end
  end
end
