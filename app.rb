require 'bundler'
Bundle.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgesql'
  :database => 'things_to_stuff'
)
            # ***Models***
require './models/user'
#           ***Routing***
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

delete '/api/users/:id' do
  content_type :json
  user = User.delete(params[:id].to_i)
  {message: 'Success'}.to_json
 end
