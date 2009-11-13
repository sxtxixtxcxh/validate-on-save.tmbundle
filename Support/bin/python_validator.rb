#!/usr/bin/env ruby
FILEPATH = ENV["TM_FILEPATH"]
PYFLAKES = ENV["TM_PYFLAKES"]

if PYFLAKES
  result = `"#{PYFLAKES}" "#{FILEPATH}" 2>&1`
end

puts result