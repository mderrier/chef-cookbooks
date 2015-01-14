# Remount Filesystems with ACL enabled

node[:acl][:setup].each do |infos|
  script "remount #{infos[:path]}" do
    interpreter "bash"
    user "#{( infos[:exec][:user] rescue "root" )}"
    cwd  "#{infos[:exec][:path]}"

    code <<-EOH
      mount -o remount,acl #{infos[:path]}
    EOH
  end
end

# Deploy ACLs

node[:acl][:deploy].each do |infos|
  rules   = []
  options = ""

  # Set users rights

  unless infos[:user].nil?
    infos[:user].each do |user|
      user[:name].each do |userName|
        rules << "-m u:#{userName}:#{user[:permissions]}"
      end
    end
  end

  # Set groups rights

  unless infos[:group].nil?
    infos[:group].each do |group|
      group[:name].each do |groupName|
        rules << "-m g:#{groupName}:#{group[:permissions]}"
      end
    end
  end

  # Set options

  unless infos[:options].nil?
    options = "-#{infos[:options]}"
  end

  # Execute commands

  unless rules.empty?
    unless infos[:exec].nil? || infos[:exec][:path].nil?
      infos[:exec][:path].each do |curPath|
        script "setfacl #{curPath}" do
          interpreter "bash"
          user "#{infos[:exec][:user] || "root"}"
          cwd  "#{curPath}"
        
          code <<-EOH
            mkdir -p #{infos[:path].join(' ')}
            setfacl #{options} #{rules.join(' ')} #{infos[:path].join(' ')}
          EOH
        end
      end
    end
  end
end

