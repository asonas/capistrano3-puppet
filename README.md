[![wercker status](https://app.wercker.com/status/72cd6ed8d34fa324ec92a851c68bfe0a/m "wercker status")](https://app.wercker.com/project/bykey/72cd6ed8d34fa324ec92a851c68bfe0a)

# Capistrano3::Puppet

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano3-puppet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano3-puppet

## Usage

in Capfile:

```
require 'capistrano3/puppet'
```

in deploy.rb:

```
set :puppet_roles, :app
set :puppet_modulepath, "roles:modules"
```

in config/deploy/*.rb

```
set :puppet_manifest_file, "manifests/amanusa.pp"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
