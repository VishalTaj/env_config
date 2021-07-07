require 'ostruct'

module EnvConfig
  class Options < OpenStruct
    # Options takes care parsing yaml files to ruby openstruct.

    PathNotFound = Class.new(StandardError)
    attr_accessor :settings

    def self.load_path(env, root_path)
      # loading settings files from project directory
      settings_path = File.join(root_path, 'config', 'settings.yml')
      env_path = File.join(root_path, 'config', 'settings', "#{env}.yml")

      # convert yaml to hash
      settings_hash = File.exist?(settings_path) ? (YAML.load_file(settings_path) || {}) : {}
      env_hash = File.exist?(env_path) ? (YAML.load_file(env_path) || {}) : {}

      # parse it to the envconfig object
      parse_env(settings_hash.merge(env_hash))
    end

    def self.parse_env(object)
      case object
      when Hash
        new(Hash[object.map { |k, v| [k, parse_env(v)] }])
      when Array
        object.map { |x| parse_env(x) }
      else
        object
      end
    end
  end
end
