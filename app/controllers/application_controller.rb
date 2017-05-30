class ApplicationController < ActionController::API

  #require gems to enable user authetication and password/ token encryption and decryption
  require 'jwt'
  require 'dotenv-rails'
  require 'bcrypt'

  #authenticate token if the decoded token matches the bearer token
  def authenticate_token
    puts "AUTHENTICATE JWT"
    render json: {status: 401, message: "unauthorized"} unless decode_token(bearer_token)
  end

  #take the header and token and check if they match to allow access
  def bearer_token
    puts "BEARER TOKEN"
    puts header = request.env["HTTP_AUTHORIZATION"]
    pattern = /^Bearer /
    puts "TOKEN WITHOUT BEARER"
    puts header.gsub(pattern, '') if header && header.match(pattern)
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  #decode the token using the secrets
  def decode_token(token_input)
    puts "DECODE TOKEN, token input: #{token_input}"
    puts token = JWT.decode(token_input, ENV["JWT_SECRET"], true)
    JWT.decode(token_input, ENV["JWT_SECRET"], true)
  rescue
    render json: {status: 401, message: "unauthorized"}
  end

  #find the current user by thier token
  def get_current_user
    return if !bearer_token
    decoded_jwt = decode_token(bearer_token)
    User.find(decoded_jwt[0]["user"]["id"])
  end

  def show
    render json: get_current_user
  end

  #check the current user against the id to validate the authorization
  def authorize_user
    puts "AUTHORIZE USER"
    puts "params #{params[:id]}"
    render json: {status: 401, message: "unauthorized"} unless get_current_user.id == params[:id].to_i
  end

  # def authorize_quilt_create
  #   puts "AUTHORIZE QUILT BLOCK CREATE"
  #   puts "user id: #{get_current_user.id}"
  #   puts "params #{quilt_block_params[:user_id]}"
  #   render json: {status: 401, message: "Unauthrized"} unless get_current_user.id == quilt_block_params[:user_id]
  # end

end
