node[:deploy].each do |application, deploy|
  node[:composer][:setup].each_with_index do |infos, i|
    unless infos[:exec].nil? || infos[:exec][:app].nil?
      if infos[:exec][:app].include? "#{application}"
        if node.normal[:composer][:setup][i][:exec][:path].nil?
          node.normal[:composer][:setup][i][:exec][:path] = [];
        end
  
        node.normal[:composer][:setup][i][:exec][:path] << "#{deploy[:deploy_to]}/current"
      end
    end
  end
end

include_recipe "composer::setup"