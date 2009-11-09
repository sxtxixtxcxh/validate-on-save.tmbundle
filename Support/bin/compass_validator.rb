#!/usr/bin/env ruby
FILEPATH = ENV['TM_FILEPATH']
PATHS = File.dirname(FILEPATH).split('/');
compass_root = FILEPATH.split("/app/")[0]

dir = ''
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
  result = `compass --update #{compass_root.gsub(' ','\ ')} 2>&1`
else
  result = "Could not automatically determine your Compass project root."
end

puts result