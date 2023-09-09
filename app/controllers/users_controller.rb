class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create, :index]

    def index
        users = User.all
        render json: users
    end
    
    def profile
        render json: {  user: current_user }, include: [:products, orders: {include: :order_items}], status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, jwt: @token }, include: [:products, orders: {include: :order_items}] 
        else
            render json: { message: 'Failed to create user. Please try again.' }, status: :unprocessable_entity
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: {  user: current_user }, include: [:products, orders: {include: :order_items}], status: :accepted
        else 
            render json: { message: 'Failed to update user. Please try again.' }, status: :unprocessable_entity
        end 
    end 
    
    private 
    
    def user_params
        params.require(:user).permit(:name, :email, :address, :city, :state, :zip, :password, :password_confirmation)
    end

end