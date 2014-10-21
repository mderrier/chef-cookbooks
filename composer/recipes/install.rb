# Setup and run commands

node[:composer][:install].each do |infos|
  options    = []
  command    = "install"
  executable = "./composer.phar"

  # Custom executable

  unless infos[:exec].nil? || infos[:exec][:executable].nil?
    executable = infos[:exec][:executable]
  end

  # Whether or not install depencies globally

  unless infos[:global].nil?
    if infos[:dev] === true
      command = "global #{command}"
    end
  end

  # Prefered installation method

  unless infos[:prefer].nil?
    options << "--prefer-#{infos[:prefer]}"
  end

  # Whether or not install dev dependencies

  unless infos[:dev].nil?
    if infos[:dev] === false
      options << "--no-dev"
    elsif infos[:dev] === true
      options << "--dev"
    end
  end

  # Whether or not use composer scripts

  unless infos[:scripts].nil?
    if infos[:scripts] === false
      options << "--no-scripts"
    end
  end

  # Whether or not use composer pluggins

  unless infos[:pluggins].nil?
    if infos[:pluggins] === false
      options << "--no-pluggins"
    end
  end

  # Whether or not optimize autoloader

  unless infos[:optimize_autoloader].nil?
    if infos[:optimize_autoloader] === true
      options << "--optimize-autoloader"
    end
  end

  # Run commands

  unless infos[:exec].nil? || infos[:exec][:path].nil?
    infos[:exec][:path].each do |curPath|
      script "composer install @ #{curPath}" do
        interpreter "bash"
        user "#{infos[:exec][:user] || "root"}"
        cwd  "#{curPath}"
      
        code <<-EOH
          #{executable} #{command} #{options.join(' ')}
        EOH
      end
    end
  end
end