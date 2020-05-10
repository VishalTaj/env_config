require "env_config/version"
require "env_config/configuration"
require "env_config/options"

module EnvConfig
  class << self
    def configure(name: 'Settings', env: 'development')
      @config ||= Configuration.new(name, env)
    end

    def reload!
      @config.reload!
    end
  end
end