Dir['/opt/stack/ghs_project/*'].each do |file_name|
  next if File.directory? file_name 
end
