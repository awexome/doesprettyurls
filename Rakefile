# AWEXOME LABS
# Rakefile

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "doesprettyurls"
  gem.homepage = "http://github.com/awexome/doesprettyvalues"
  gem.license = "MIT"
  gem.summary = %Q{Uses ActiveRecord to_param to force your individual models to have attractive and more SEO-friendly URLs}
  gem.description = %Q{Uses ActiveRecord to_param to force your individual models to have attractive and more SEO-friendly URLs}
  gem.email = "gems@awexomelabs.com"
  gem.authors = ["Awexome Labs"]
  
  # Internal Gem Dependencies:
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "doesprettyurls #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
