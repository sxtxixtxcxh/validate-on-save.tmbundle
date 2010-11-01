#!/usr/bin/env ruby
FILEPATH = ENV['TM_FILEPATH']
SUPPORT  = ENV['TM_BUNDLE_SUPPORT']
PROFILE = ENV['VOS_CSS_PROFILE'] || 'css21'

result = `java -jar #{SUPPORT.gsub(' ','\ ')}/bin/css/css-validator.jar --profile=#{PROFILE} file:#{FILEPATH.gsub(' ','\ ')}`

result.gsub!(/^Valid CSS information.*/m, '')

puts result