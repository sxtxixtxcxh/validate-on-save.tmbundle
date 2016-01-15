class VOS
  class Validate
    def self.bash
      bash_bin = ENV["TM_BASH"] ||= "bash"
      VOS.output({
        :info => `echo Running syntax check with bash-$("#{bash_bin}" --version | head -n1 | awk {'print $4'})`,
        :result => `"#{bash_bin}" -n 2>&1`,
        :match_ok => /^$/i,
        :match_line => /line (\d+)/i,
        :lang => "Bash"
      })
    end
  end
end
