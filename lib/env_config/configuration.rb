module EnvConfig
  class Configuration
    attr_accessor :name, :env

    def initialize(name = 'Settings', env = 'development')
      self.name = name
      self.env = env
      load_path
    end

    def reload!
      load_path
    end

    def load_path
      Object.send(:remove_const, name) if Object.const_defined?(name)
      Object.const_set(name, EnvConfig::Options.load_path(env).freeze)
      Object.const_defined?(name)
    end
  end
end
