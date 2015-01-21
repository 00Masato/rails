source 'https://rubygems.org'

gemspec

if ENV['AREL']
  gem 'arel', :path => ENV['AREL']
else
  gem 'arel'
end

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jquery-rails'

if ENV['JOURNEY']
  gem 'journey', :path => ENV['JOURNEY']
else
  gem 'journey'
end

if RUBY_VERSION < '1.9.3'
  gem 'i18n', '~> 0.6.11'
end
gem 'test-unit', '~> 3.0'

# This needs to be with require false to avoid
# it being automatically loaded by sprockets
gem 'uglifier', '>= 1.0.3', :require => false

# execjs >= 2.1.0 doesn't work with Ruby 1.8
gem 'execjs', '< 2.1.0'

gem 'rake', '>= 0.8.7'
gem 'mocha', '~> 0.14', :require => false

group :doc do
  # The current sdoc cannot generate GitHub links due
  # to a bug, but the PR that fixes it has been there
  # for some weeks unapplied. As a temporary solution
  # this is our own fork with the fix.
  gem 'sdoc',  :git => 'git://github.com/fxn/sdoc.git'
  gem 'RedCloth', '~> 4.2'
  gem 'w3c_validators'
end
# AS
gem 'memcache-client', '>= 1.8.5'

# Add your own local bundler stuff
instance_eval File.read '.Gemfile' if File.exists? '.Gemfile'

platforms :mri do
  group :test do
    gem 'ruby-prof', '~> 0.11.2' if RUBY_VERSION < '2.0'
  end
end

platforms :ruby do
  gem 'yajl-ruby'
  gem 'nokogiri', '>= 1.4.5', '< 1.6'

  # AR
  gem 'sqlite3', '~> 1.3.5'

  group :db do
    if RUBY_VERSION < '1.9.3'
      gem 'pg', '>= 0.11.0', '< 0.18'
    else
      gem 'pg', '>= 0.11.0'
    end
    gem 'mysql', '>= 2.8.1'
    gem 'mysql2', '>= 0.3.10'
  end
end

gem 'benchmark-ips'
