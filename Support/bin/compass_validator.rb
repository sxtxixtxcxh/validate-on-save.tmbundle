#!/usr/bin/env ruby
FILEPATH = ENV["TM_FILEPATH"]
PATHS = File.dirname(FILEPATH).split('/');
COMPASS_BIN = ENV["TM_COMPASS"] ||= "compass"
compass_root = FILEPATH.split("/app/")[0] || FILEPATH.split("/public/")[0]

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
  result = "Could not automatically determine your Compass project root."
end

puts result