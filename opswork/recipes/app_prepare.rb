node[:deploy].each do |application, deploy|

  user "#{application}" do
    comment "Auto-generated user for #{application}"
    supports :manage_home => true
    home "/home/#{application}"
    shell "/bin/bash"
    action :create
  end

  directory "/home/#{application}" do
    owner "#{application}"
    group "#{application}"
    mode 0755
    action :create
  end

  file "/home/#{application}/.app_env" do
    user "#{application}"
    group "opsworks"
    mode "0644"
    action :create_if_missing
  end

  file "/home/#{application}/.profile" do
    user "#{application}"
    group "opsworks"
    mode "0644"
    action :create_if_missing
  end

  ruby_block "insert_line" do
    block do
      file = Chef::Util::FileEdit.new("/home/#{application}/.profile")
      file.insert_line_if_no_match(/^\.\s+\"\$HOME\/\.app\_env\"$/, '. "$HOME/.app_env"')
      file.write_file
    end
  end

  deploy[:environment].each do |key, value|
    ruby_block "insert_line" do
      block do
        file = Chef::Util::FileEdit.new("/home/#{application}/.app_env")
        file.search_file_delete_line(/^export #{key}=/)
        file.insert_line_if_no_match(/^export #{key}=/, "export #{key}=#{value}")
        file.write_file
      end
    end
  end
end

include_recipe "acl::deploy"