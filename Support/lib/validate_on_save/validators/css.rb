class VOS
  class Validate
    def self.css
      css_validator_bin = "#{ENV['TM_BUNDLE_SUPPORT']}/bin/css_validator.rb"
      VOS.output({
        :info => "Running syntax check...\n",
        :result => `"#{css_validator_bin}"`,
        :match_ok => /Congratulations! No Error Found./i,
        :match_line => /line \: (\d+)/i,
        :lang => "CSS"
      })
    end
  end
end
