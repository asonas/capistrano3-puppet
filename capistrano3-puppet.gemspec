lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano3/puppet/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano3-puppet"
  spec.version       = Capistrano3::Puppet::VERSION
  spec.authors       = ["asonas"]
  spec.email         = ["hzw1258@gmail.com"]
  spec.description   = %q{puppet apply in capistrano tasks}
  spec.summary       = %q{puppet apply in capistrano tasks}
  spec.homepage      = "https://github.com/asonas/capistrano3-puppet"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '>= 3.1.0'
  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
