node[:acl][:setup].each do |infos|
  script "remount #{infos[:path]}" do
    interpreter "bash"
    user "#{infos[:exec][:user] || "root"}"
    cwd  "#{infos[:exec][:path] || "/"}"

    code <<-EOH
      mount -o remount,acl #{infos[:path]}
    EOH
  end
end