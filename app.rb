require 'bundler'
Bundle.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgesql'
  :database => ''

)
