# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name = %q{raven}
  gem.version = Raven::VERSION
  gem.authors = ["David Cramer"]
  gem.summary = %q{Raven is a client for Sentry}
  gem.description = %q{Raven is a client for Sentry (http://getsentry.com)}
  gem.email = %q{dcramer@gmail.com}
  gem.files =  Dir['lib/**/*'] + Dir['spec/**/*'] + Dir['*.rb'] + ["raven.gemspec"]
  gem.homepage = %q{http://getsentry.com/}
  gem.require_paths = ["lib"]
  gem.executables << 'raven'
  gem.rubyforge_project = %q{raven}
  gem.requirements << "json_pure, json-jruby or json gem required"
  gem.add_dependency 'rack'
end
