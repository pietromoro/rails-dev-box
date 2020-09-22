require 'optparse'

desc "Setup development environment"
task :setup do
  options = { gituser: 'rails', repo: 'rails' }
  OptionParser.new do |opts|
    opts.banner = "Usage: rake setup [options]"
    opts.on("-u", "--gituser ARG", String) { |str| options[:gituser] = str }
    opts.on("-r", "--repo ARG", String) { |str| options[:repo] = str }
  end.parse!

  puts "Cloning repo"
  sh "git clone https://github.com/#{options[:gituser]}/#{options[:reponame]}"
  puts "Composing..."
  sh 'docker-compose up'
  puts "Bundling..."
  sh 'docker-compose run rails-dev-box /bin/sh -c "bundle install"'
end

desc "Teardown development environment"
task :teardown do
  sh 'docker-compose down'
  rm_r 'rails'
  rm_r 'bundle'
end

desc "Execute tests"
task :test do
  options = { step: 'all' }
  OptionParser.new do |opts|
    opts.banner = "Usage: rake test [options]"
    opts.on("-s", "--step ARG", String) { |str| options[:step] = str }
  end.parse!
  puts options

  if options[:step] == 'all'
    sh 'docker-compose run rails-dev-box /bin/sh -c "rake test"'
  else
    sh "docker-compose run rails-dev-box /bin/sh -c \"cd #{options[:step]} && rake test\""
  end
end
