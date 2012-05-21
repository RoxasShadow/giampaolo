Kernel.load 'lib/giampaolo/version.rb'

Gem::Specification.new { |s|
	s.name          = 'giampaolo'
	s.version       = Giampaolo.version
	s.author        = 'Giovanni Capuano'
	s.email         = 'webmaster@giovannicapuano.net'
	s.homepage      = 'http://www.giovannicapuano.net'
	s.platform      = Gem::Platform::RUBY
	s.summary       = 'Adds javascript files from a mirror list.'
	s.description   = 'Just add javascript files quickly with giampaolo.'
	s.require_paths = ['lib']
	s.files         = Dir.glob('lib/**/*.rb')
	s.executables   = 'giampaolo'
}
