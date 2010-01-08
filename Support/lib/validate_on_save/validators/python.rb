class VOS
  class Validate
    def self.python
      py_validator = "#{ENV['TM_BUNDLE_SUPPORT']}/bin/python_validator.rb"
      VOS.output({
        :info => `echo "SPyFlakes - #{ENV['VOS_PYFLAKES']}"`,
        :result => `"#{py_validator}"`,
        :match_ok => /^$/,
        :match_line => /line (\d+)/i,
        :lang => "Python"
      }) if ENV['TM_PYFLAKES']
    end
  end
end
