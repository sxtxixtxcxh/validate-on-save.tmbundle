class VOS
  class Validate
    def self.sass
      compass_validator_bin = "#{ENV['TM_BUNDLE_SUPPORT']}/bin/compass_validator.rb"
      result = `"#{compass_validator_bin}"`
      result.gsub!(/\[\d{1,2}m/, '') #strip formatting
      result = result.scan(/error.*\((.*)\)$/).map(&:first).join("\n")
      
      VOS.output({
        :result => result,
        :match_ok => /^$/,
        :match_line => /^(\d+):\s/i,
        :lang => "Sass"
      })
    end
  end
end
