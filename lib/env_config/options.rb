require 'ostruct'

module EnvConfig
  class Options < OpenStruct
    PathNotFound = Class.new(StandardError)
    
    attr_accessor :settings
    def self.load_path(env)
      settings_path = File.join(Dir.pwd, 'config', 'settings.yml')
      env_path = File.join(Dir.pwd, 'config', 'settings', "#{env}.yml")
      settings_hash = {}
      env_hash = {}
      if File.exist?(settings_path)
        settings_hash = YAML.load_file(settings_path) || {}
      end
      if File.exist?(env_path)
        env_hash = YAML.load_file(env_path) || {}
      end
      return self.to_ostruct(settings_hash.merge(env_hash))
    end

    def self.to_ostruct(object)
      case object
      when Hash
        self.new(Hash[object.map {|k, v| [k, to_ostruct(v)] }])
      when Array
        object.map {|x| to_ostruct(x) }
      else
        object
      end
    end
  end
end