#!/usr/bin/env ruby
FILEPATH = ENV["TM_FILEPATH"]
PYFLAKES = ENV["VOS_PYFLAKES"]

if PYFLAKES
  result = `"#{PYFLAKES}" "#{FILEPATH}" 2>&1`
else
  result = "You're gonna need to install PyFlakes."
end

puts result