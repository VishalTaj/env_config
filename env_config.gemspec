lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "env_config/version"

Gem::Specification.new do |spec|
  spec.name          = "env_config"
  spec.version       = EnvConfig::VERSION
  spec.authors       = ["Vishal Taj"]
  spec.email         = ["getvishalonline@gmail.com"]

  spec.summary       = "To handle multi environment configuration"
  spec.description   = "To handle multi environment configuration"
  spec.homepage      = "https://github.com/VishalTaj/env_config"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/VishalTaj/env_config"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
