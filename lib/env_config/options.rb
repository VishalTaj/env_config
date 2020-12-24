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
      settings_hash = (YAML.load_file(settings_path) || {}) if File.exist?(settings_path)
      env_hash = (YAML.load_file(env_path) || {}) if File.exist?(env_path)
      to_ostruct(settings_hash.merge(env_hash))
    end

    def self.to_ostruct(object)
      case object
      when Hash
        new(Hash[object.map { |k, v| [k, to_ostruct(v)] }])
      when Array
        object.map { |x| to_ostruct(x) }
      else
        object
      end
    end
  end
end
