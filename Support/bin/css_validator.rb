#!/usr/bin/env ruby
FILEPATH = ENV['TM_FILEPATH']
result = `java -jar css/css-validator.jar file:#{FILEPATH} 2>&1`

puts result