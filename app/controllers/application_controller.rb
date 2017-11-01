require './config/environment'
require 'byebug'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end



  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    erb :show
  end

  # post '/posts/:id' do
  #   @post = Post.find(params[:id])
  #   erb :show
  # end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end



  get '/posts' do
    @posts = Post.all
    erb :index
  end

  delete '/posts' do
    # byebug
    @destroyed = Post.find(params[:id].to_i).destroy
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    Post.create(params[:post])
    @posts = Post.all
    erb :index
  end

end
