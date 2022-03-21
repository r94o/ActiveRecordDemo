# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'

class MakersBnB < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end
  register Sinatra::ActiveRecordExtension

  get '/' do
    @user = User.find_by(id: '1')
    erb(:index)
  end

  post '/add_user' do
    user = User.new(users: params[:username])
    user.password = params[:password]
    user.save!
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
