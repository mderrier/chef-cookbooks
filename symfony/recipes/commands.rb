node[:symfony][:commands].each do |infos|
    console    = 'app/console'
    command    = "#{infos[:command]}"
    attributes = []
    options    = []

    if infos[:attributes].kind_of? (Array)
        attributes = infos[:attributes];
    end

    infos[:options].each do |option, value|
        o = "--#{option}"

        unless value.nil?
            o << "=#{value}"
        end

        options << o
    end

    unless infos[:exec].nil? || infos[:exec][:path].nil?
        infos[:exec][:path].each do |curPath, vars|
            execute "#{console} @ #{curPath}" do
                cwd  "#{curPath}"
                user "#{infos[:exec][:user] || "root"}"
                environment vars

                command "#{console} #{command} #{attributes.join(' ')} #{options.join(' ')}"
                action :run
            end
        end
    end
end