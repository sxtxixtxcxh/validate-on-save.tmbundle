class VOS
  class Validate
    def self.sass
      compass_validator_bin = "#{ENV['TM_BUNDLE_SUPPORT']}/bin/compass_validator.rb"
      result = `"#{compass_validator_bin}"`
      result.gsub!(/^\s*directory.*?$/, '')
      result.gsub!(/^\s*compile.*?$/, '')
      result.gsub!(/^\s*create.*?$/, '')
      result.gsub!(/^\s*overwrite.*?$/, '')
      result.gsub!(/^\s*exists.*?$/, '')
      result.gsub!(/^\s*unchanged.*?$/, '')
      result.gsub!(/^\s*identical.*?$/, '')
      result.strip!()
      VOS.output({
        :result => result,
        :match_ok => /^$/,
        :match_line => /^(\d+):\s/i,
        :lang => "Sass"
      })
    end
  end
end
