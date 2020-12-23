# EnvConfig

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/env_config`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Run execute:

    $ bundle

Add this line to your application's Gemfile:

```ruby
gem 'env_config', git: 'git@github.com:VishalTaj/env_config.git'
```
Run this command to generate env files:

    $ rails g env_config:install

Add this line to `application.rb` file:

```ruby
config.env_config = EnvConfig.configure, {
 name: 'Settings',
 env: Rails.env
}
```

Where `name` will be the Constant which we can use to access configuration variables.

## Usage

```ruby
Settings.env_variable
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/VishalTaj/env_config. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EnvConfig project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/VishalTaj/env_config/blob/master/CODE_OF_CONDUCT.md).
