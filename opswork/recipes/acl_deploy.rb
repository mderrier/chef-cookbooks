node[:deploy].each do |application, deploy|
  node[:acl][:deploy].each_with_index do |infos, i|
    unless infos[:exec].nil? || infos[:exec][:app].nil?
      if infos[:exec][:app].include? "#{application}"
        if node.normal[:acl][:deploy][i][:exec][:path].nil?
          node.normal[:acl][:deploy][i][:exec][:path] = [];
        end

        node.normal[:acl][:deploy][i][:exec][:path] << "#{deploy[:deploy_to]}/current"
      end
    end
  end
end

include_recipe "acl::deploy"