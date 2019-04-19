# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ilm/version'

Gem::Specification.new do |spec|
  spec.name          = 'ilm'
  spec.version       = Ilm::VERSION
  spec.authors       = ['Syed Fazil Basheer', 'Somesh Choudhary']
  spec.email         = ['fazil.basheer@quester.xyz', 'c.somesh5@gmail.com']

  spec.summary       = 'A gem for scientific data.'
  spec.description   = 'A gem for scientific data.'
  spec.homepage      = 'https://github.com/ilm-labs/ilm'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org.
  # To allow pushes either set the 'allowed_push_host'
  #   to allow pushing to a single host
  # or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] =
  #     'https://github.com/ilm-labs/ilm'
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

  spec.add_development_dependency 'bundler', '~> 2.0', '>= 2.0.1'
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.2'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.67.2'
  spec.add_development_dependency 'rubocop-performance', '~> 1.1'
  
  spec.add_dependency             'rubypython', '~> 0.6.4'
  spec.add_dependency             'unitwise', '~>2.2'
end
