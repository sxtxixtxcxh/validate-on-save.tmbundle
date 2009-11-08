#!/usr/bin/env ruby
FILEPATH = ENV['TM_FILEPATH']
PATHS = File.dirname(FILEPATH).split('/');
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

if defined? COMPASS_ROOT || COMPASS_ROOT = FILEPATH.split("/app/")[0]
  result = `compass --update #{COMPASS_ROOT.gsub(' ','\ ')} 2>&1`
else
  result = "Could not automatically determine your Compass project root."
end

puts result