desc 'Run specs.'
task 'spec' do
  require 'minitest/autorun'
  Dir.glob('spec/*_spec.rb').each { |file| require_relative file}
end

task :default => [:spec]
