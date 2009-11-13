#!/usr/bin/env ruby
FILEPATH = ENV["TM_FILEPATH"]
PYFLAKES = ENV["VOS_PYFLAKES"]

if PYFLAKES
  result = `"#{PYFLAKES}" "#{FILEPATH}" 2>&1`
end

puts result