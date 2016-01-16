# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peek-alt-routes/version'

Gem::Specification.new do |gem|
  gem.name          = 'peek-alt-routes'
  gem.version       = Peek::AltRoutes::VERSION
  gem.authors       = ['Chris Ewald']
  gem.email         = ['chrisewald@gmail.com']
  gem.description   = %q{Easily toggle alternate controllers and routes with peek.}
  gem.summary       = %q{Easily toggle alternate controllers and routes with peek.}
  gem.homepage      = 'https://github.com/mkcode/peek-alt-routes'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'peek'
end
