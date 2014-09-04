require File.join(Rails.root, '../lib/double_dog.rb')

### Stub authentication
# Create a user
user = DoubleDog.db.create_user(:username => 'alice', :password => 'pass1', :admin => true)

# Sign in that user
result = DoubleDog::SignIn.new.run(:username => 'alice', password: 'pass1')

# Store the session id in a global variable
$session_id = result[:session_id]