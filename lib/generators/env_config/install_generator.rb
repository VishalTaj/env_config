  
module EnvConfig
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    def copy_initializer
      template 'settings.yml', 'config/settings.yml'
      FileUtils.mkdir_p "#{Dir.pwd}/config/settings"
      ['development', 'production', 'test'].each do |env|
        template 'local.yml', "config/settings/#{env}.yml"
      end
    end
    
    def modify_gitignore
      create_file '.gitignore' unless File.exists? '.gitignore'

      append_to_file '.gitignore' do
        "\nconfig/settings.yml\n"
      end
    end

  end
end