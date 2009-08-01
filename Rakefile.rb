require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

load 'ai4r.gemspec'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "ai4r"
    gemspec.description = "Describe your gem"
    gemspec.email = "sergio@jadeferret.com"
    gemspec.homepage = "http://ai4r.rubyforge.org"
    gemspec.authors = ["Sergio Fierens"]
    gemspec.rubyforge_project = "ai4r"
    gemspec.summary = <<-DESC.strip.gsub(/\n\s+/, " ")
    Ruby implementations of algorithms covering several
    Artificial intelligence fields, including Genetic
    algorithms, Neural Networks, machine learning, and clustering.
  DESC
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end


Rake::TestTask.new do |t|
  t.test_files = FileList["test/**/*_test.rb"]
end

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_dir = "rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
  rd.title = "ar4r - Artificial Intelligence For Ruby - API DOC"
end

#Rake::GemPackageTask.new(SPEC) do |pkg|
#  pkg.need_zip = true
#end 

