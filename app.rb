require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chirpdb'
)

# ----------------***Models***
require './models/user'
require './models/chirp'


# ---------------***Routing***
get '/' do
  erb :index
end


# ---------Get all Users
get '/api/users' do
  content_type :json
  User.all.to_json
end

# ----------Get User by ID
get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end

# ------------Create User
post'/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.create(params[:user])
  user.to_json
end

# -------------Update User
patch '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

# --------------Delete User
delete '/api/users/:id' do
  content_type :json
  user = User.delete(params[:id].to_i)
  {message: 'Success'}.to_json
 end

 # A specific user's chirps
 get '/api/users/:user_id/chirps' do
   content_type :json
   user = User.find(params[:user_id].to_i)
   chirp = user.chirps
   chirp.to_json
 end

 # A specific user's specific chirp
 get '/api/users/:user_id/chirps/:id' do
   content_type :json
   user = User.find(params[:user_id].to_i)
   chirp = user.chirps.find(params[:id].to_i)
   chirp.to_json
 end

 # Create a Chirp for a user
 post '/api/users/:user_id/chirps' do
   content_type :json
   user = User.find(params[:user_id].to_i)
   chirp - user.chirps.create(params[:chirp])
   user.chirp << chirp
   chirp.to_json
 end

 # Update a user's existing chirp
 put '/api/users/:user_id/chirps/:id' do
   content_type :json
   chirp = Chirp.find(params[:id].to_i)
   chirp.update(params[:chirp])
   chirp.to_json
 end

 # Update a user's existing chirp
 patch '/api/users/:user_id/chirps/:id' do
   content_type :json
   chirp = Chirp.find(params[:id].to_i)
   chirp.update(params[:chirp])
   chirp.to_json
 end

 # Delete a user's existing chirp
delete '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirp = user.chirps.delete(params[:id].to_i)
  {message: 'chirp has been deleted'}.to_json
end
