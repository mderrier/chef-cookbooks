# Compile parameters files

files = {}

node[:symfony][:parameters].each do |infos|
  unless infos[:exec].nil? || infos[:exec][:path].nil?
    infos[:exec][:path].each do |curPath|
      absPath = "#{curPath}/#{infos[:path] || "app/config/parameters.yml"}"
    
      if files[absPath].nil?
        files[absPath] = {}
      end
    
      infos[:rows].each do |key, value|
        files[absPath][key] = value
      end
    end
  end
end

# Execute templates

files.each do |path, rows|
  template "#{path}" do
    source "parameters.yml.erb"
    mode 0644
    group "root"
    owner "deploy"
  
    variables(
      :rows => rows
    )
  
    only_if do
      File.directory?(File.dirname("#{path}"))
    end
  end
end