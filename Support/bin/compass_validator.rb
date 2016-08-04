#!/usr/bin/env ruby
filepath = ENV["TM_FILEPATH"]
paths = File.dirname(filepath).split('/');

if ENV["TM_COMPASS"] != "false"
  compass_bin = ENV["TM_COMPASS"] ||= "compass"
  compass_root = (split = filepath.split("/app/")).size > 1 ? split[0] : false
  paths.reverse.each do |path|
    dir = paths[0,paths.index(path)+1].join('/')
    if !dir.empty? && File.exist?(File.join(dir, 'config.rb'))
      compass_root = dir and break
    end
  end
end

if compass_root
  puts `bundle exec #{compass_bin} compile --dry-run #{compass_root.gsub(' ','\ ')} #{filepath} 2>&1`
else
  sass_bin = ENV["TM_SASS"] ||= "sass"
  puts `"#{sass_bin}" -c "#{filepath}" 2>&1`
end
