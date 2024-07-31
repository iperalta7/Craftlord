require 'rake'
require 'rspec/core/rake_task'

desc "Run discord bot"
task :run do
  ruby 'src/bot.rb'
end

desc "Run tests"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob("src/spec/**/*_spec.rb")
  t.rspec_opts = "--format documentation"
end
