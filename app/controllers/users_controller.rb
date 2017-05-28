class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]
  # user needs a token for all user routes but for login and create
  before_action :authenticate_token, except: [:login, :create]
  #user needs to be authorized before all routes but for login create and index
  before_action :authorize_user, except: [:login, :create, :index]

#CHANGE STATUSES TO 401 and 201

  #user can login with authentication and and json web tokens
  def login
    #find the user by the unique username
    user = User.find_by(username: params[:user][:username])
    #if the user and the authentication match
    if user && user.authenticate(params[:user][:password])
      #give the user a token
      token = create_token(user.id, user.username)
      #let them be logged in and have access
      render json: {status: 200, token: token, user: user}
    #otherwise they will be denied access
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  #validate that the username is unique
  rescue ActiveRecord::RecordNotUnique
    render json: {status: 401, message: "username taken, try again"}
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(get_current_user.id)
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    #validate destroy with current user
    @user.destroy
  end

  private #================================

    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    #set header payload and signature validations
    def payload(id, username)
      {
        exp: (Time.now + 30.minutes).to_i,
        iat: Time.now.to_i,
        iss: ENV["JWT_ISSUER"],
        user: {
          id: id,
          username: username
        }
      }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :password_digest, :years_quilting, :favorite_block)
    end

end
