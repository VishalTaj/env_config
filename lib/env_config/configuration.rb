module EnvConfig
  class Configuration
    attr_accessor :name, :env

    def initialize(name='Settings', env='development')
      self.name = name
      self.env = env 
      self.load_path
    end

    def reload!
      self.load_path
    end

    def load_path
      Object.send(:remove_const, self.name) if Object.const_defined?(self.name)
      Object.const_set(self.name, EnvConfig::Options.load_path(self.env).freeze)
      Object.const_defined?(self.name)
    end
  end
end