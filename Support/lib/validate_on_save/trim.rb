class VOS
  def self.trim
    input = STDIN.read
    input.gsub!(/(.*?)(\S+)[\t ]+$/s, "\\1\\2") if opt("VOS_TRIM_LINES")
    puts input
  end
end
