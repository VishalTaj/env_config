module EnvConfig
  class Configuration
    attr_reader :name, :env, :root_path

    def initialize(name = 'Settings', env = 'development', root_path = nil)
      @name = name
      @env = env
      @root_path = root_path || ENV['RAILS_ROOT']
      load_path
    end

    def reload!
      load_path
    end

    def load_path
      Object.send(:remove_const, @name) if Object.const_defined?(@name)
      Object.const_set(@name, EnvConfig::Options.load_path(@env, @root_path).freeze)
      Object.const_defined?(@name)
    end
  end
end
