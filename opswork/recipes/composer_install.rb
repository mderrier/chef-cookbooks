node[:deploy].each do |application, deploy|
  node[:composer][:install].each_with_index do |infos, i|
    unless infos[:exec].nil? || infos[:exec][:app].nil?
      if infos[:exec][:app].include? "#{application}"
        if node.normal[:composer][:install][i][:exec][:path].nil?
          node.normal[:composer][:install][i][:exec][:path] = {};
        end

        node.normal[:composer][:install][i][:exec][:path]["#{deploy[:deploy_to]}/current"] = deploy[:environment_variables]
      end
    end
  end
end

include_recipe "composer::install"