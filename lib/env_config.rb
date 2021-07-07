require 'env_config/version'
require 'env_config/configuration'
require 'env_config/options'

module EnvConfig
  class << self
    def configure(name: 'Settings', env: 'development', root_path: nil)
      @configure ||= Configuration.new(name, env, root_path)
    end

    def reload!
      @configure.reload!
    end
  end
end
