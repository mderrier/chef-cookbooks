# Setup and run commands

node[:composer][:setup].each do |infos|
  options      = []
  command      = "php"
  scriptName   = "install composer"
  relativePath = ""

  # Custom install dir

  unless infos[:path].nil?
    options << "--install-dir=#{infos[:path]}"
    relativePath = "/#{infos[:path]}"
  end

  # Custom version
  
  unless infos[:version].nil?
    options << "--version=#{infos[:version]}"
    scriptName = "#{scriptName}:#{infos[:version]}"
  end

  # Custom executable name

  unless infos[:name].nil?
    options << "--filename=#{infos[:name]}"
    scriptName = "#{scriptName} (as '#{infos[:name]}')"
  end

  # Generate PHP command

  unless options.empty?
    command = "#{command} -- #{options.join(' ')}"
  end

  # Execute commands
  
  unless infos[:exec].nil? || infos[:exec][:path].nil?
    infos[:exec][:path].each do |curPath|
      script "#{scriptName} @ #{curPath}#{relativePath}" do
        interpreter "bash"
        user "#{infos[:exec][:user]}"
        group "#{infos[:exec][:group]}"
        cwd "#{curPath}"
      
        code <<-EOH
          curl -sS https://getcomposer.org/installer | #{command}
        EOH
      end
    end
  end
end