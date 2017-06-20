# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eulim/version'

Gem::Specification.new do |spec|
  spec.name          = 'eulim'
  spec.version       = Eulim::VERSION
  spec.authors       = ['Syed Fazil Basheer']
  spec.email         = ['fazil.basheer@quester.xyz']

  spec.summary       = 'A gem for scientific data.'
  spec.description   = 'A gem for scientific data.'
  spec.homepage      = 'https://github.com/syedfazilbasheer-quester/eulim-gem'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org.
  # To allow pushes either set the 'allowed_push_host'
  #   to allow pushing to a single host
  # or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] =
  #     'https://github.com/syedfazilbasheer-quester/eulim-gem'
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against ' \
  #     'public gem pushes.'
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~>0.49.1' 
  
  spec.add_dependency 'require_all', '~> 1.4.0'
	spec.add_dependency 'unitwise', '~>2.1.0'
end
