class VOS
  def self.trim
    document = STDIN.read
    document.gsub!(/(.*?)(\S+)[\t ]+$/s, "\\1\\2") if opt("VOS_TRIM_LINES")
    if opt("VOS_TRIM_DOCUMENT")
      start = document.index(/\S/)
      document = document[0,start] + document[start,(document.length-start)].strip
    end
    puts document
  end
end
