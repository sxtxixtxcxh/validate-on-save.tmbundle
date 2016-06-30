class VOS
  class Validate
    def self.bash_select
      if ENV["VOS_BASH_SHELLCHECK"]
        shellcheck
      else
        bash
      end
    end

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

    def self.shellcheck
      shellcheck_bin = ENV["TM_SHELLCHECK"] ||= "shellcheck"
      filepath = ENV["TM_FILEPATH"]
      VOS.output({
        :info => `echo Running syntax check with shellcheck-$("#{shellcheck_bin}" --version | head -n2 | tail -n1 | awk {'print $2'})`,
        :result => `"#{shellcheck_bin}" --shell=bash "#{filepath}" && echo VOSOK!`,
        :match_ok => /^VOSOK!$/,
        :match_line => /line (\d+)/i,
        :lang => "Bash"
      })
    end
  end
end
