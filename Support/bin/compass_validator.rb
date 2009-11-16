#!/usr/bin/env ruby
FILEPATH = ENV["TM_FILEPATH"]
PATHS = File.dirname(FILEPATH).split('/');
COMPASS_BIN = ENV["TM_COMPASS"] ||= "compass"
compass_root = (split = FILEPATH.split("/app/")).size > 1 ? split[0] : false

PATHS.reverse.each do |path|
  dir = PATHS[0,PATHS.index(path)+1].join('/')
  unless dir.empty?
    Dir.chdir( dir )
    unless( Dir.glob('config.rb').empty? )
      compass_root = dir
      break
    end
  end
end

if compass_root
  result = `"#{COMPASS_BIN}" --update #{compass_root.gsub(' ','\ ')} 2>&1`
else
  result = `sass -c "#{FILEPATH}" 2>&1`
end

puts result