require 'active_record_tasks'

ActiveRecordTasks.configure do |config|
  # These are all the default values
  config.db_dir = 'db'
  config.db_config_path = 'db/config.yml'
  config.env = 'test'
end

# Run this AFTER you've configured
ActiveRecordTasks.load_tasks

task :console do
  require './lib/double_dog.rb'
  DoubleDog.db = DoubleDog::Database::SQL.new
  require 'irb'
  ARGV.clear
  IRB.start
end
