class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    # render json: @user.to_json(only: [:id, :username])
    render :show
  end

  # POST /users
  # curl -H "Content-Type:application/json" http://localhost:3000/users -X POST -d '{"user": {"username": "Dicky"}}'                     
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # curl -i -H "Content-Type:application/json" -X PUT http://localhost:3000/api/v1/users/1 -d '{"username": "Ricardo"}'
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # curl -i -H "Content-Type:application/json" -X DELETE http://localhost:3000/ap1/v1/users/1 -d '{"user": {"id": 1}}'      
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username)
    end
end
