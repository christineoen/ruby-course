require 'active_record'
require 'active_record_tasks'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'double-dog_test'
  )