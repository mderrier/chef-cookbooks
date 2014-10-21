node[:deploy].each do |application, deploy|
  node[:symfony][:parameters].each_with_index do |infos, i|
    unless infos[:exec].nil? || infos[:exec][:app].nil?
      if infos[:exec][:app].include? "#{application}"
        if node.normal[:symfony][:parameters][i][:exec][:path].nil?
          node.normal[:symfony][:parameters][i][:exec][:path] = [];
        end
  
        node.normal[:symfony][:parameters][i][:exec][:path] << "#{deploy[:deploy_to]}/current"
      end
    end
  end
end

include_recipe "symfony::parameters"