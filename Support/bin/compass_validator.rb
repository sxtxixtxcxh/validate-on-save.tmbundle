#!/usr/bin/env ruby
FILEPATH = ENV['TM_FILEPATH']
PATHS = File.dirname(FILEPATH).split('/');
#PROJECT_ROOT =  FILEPATH.split("/app/")[0]
dir = ''
PATHS.reverse.each do |path|
  dir = PATHS[0,PATHS.index(path)+1].join('/')
  unless dir.empty?
    Dir.chdir( dir )
    unless( Dir.glob('config.rb').empty? )
      COMPASS_ROOT = dir
      break
    end
  end
end

if !defined? COMPASS_ROOT 
  COMPASS_ROOT = FILEPATH.split("/app/")[0]
  UPDATE_COMMAND = "compass --update #{COMPASS_ROOT} 2>&1"
  result = `#{UPDATE_COMMAND}`
else
  result = "Could not automatically determine your Compass project root."
end

puts result