
# Load the rails application
require File.expand_path('../application', __FILE__)
# Initialize the rails application
Lms::Application.initialize!

ENV['PATH'] = "#{ENV['PATH']}:/usr/bin/gem" #:/usr/bin/gem1.8"
ENV['GEM_PATH'] = "/home/jcalifa/.gems::/usr/lib/ruby/gems/1.8:#{ENV['GEM_PATH']}"
Gem.clear_paths

#config.gem "rack", :version => '1.2.2'