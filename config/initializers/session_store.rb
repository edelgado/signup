# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_signup_session',
  :secret      => 'bef30ef4cf54e52bf9bff339bef73d2f19bd3267ee70b59c5f46c61a64a793a9c9754f8625ba28f4ffbf7f4e9c4ec7b19a62d6b40ddfe487d4f5242006a7c1e9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
