# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_autodemo_session',
  :secret      => 'bdb5f25a96a502278676d13b4bc6bf704208142c1435ebe33fa1917f4f0364ddec7992d2108cafff140da28affd4bdd42cc03c83490e1a79ca971244cfd0b68e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
