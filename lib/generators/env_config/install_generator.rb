module EnvConfig
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __dir__)

    def copy_initializer
      template 'settings.yml', 'config/settings.yml'
      FileUtils.mkdir_p "#{Dir.pwd}/config/settings"
      %w[development production test].each do |env|
        template 'local.yml', "config/settings/#{env}.yml"
      end
    end

    def modify_gitignore
      create_file '.gitignore' unless File.exist? '.gitignore'

      append_to_file '.gitignore' do
        "\nconfig/settings.yml\n"
      end
    end
  end
end
