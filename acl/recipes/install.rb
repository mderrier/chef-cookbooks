script "install acl package" do
  interpreter "bash"
  user "root"

  code <<-EOH
    apt-get install acl
  EOH
end