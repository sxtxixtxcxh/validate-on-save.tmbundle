class VOS
  class Validate
    def self.perl
      perl_bin = ENV['TM_PERL'] ||= "perl"
      VOS.output({
        :info => `"#{perl_bin}" -e'print "Running syntax check with perl-" . $] . "\n" '`,
        :result => `"#{perl_bin}" -c 2>&1`,
        :match_ok => /syntax OK$/i,
        :match_line => /line (\d+)/i,
        :lang => "Perl"
      })
    end
  end
end
