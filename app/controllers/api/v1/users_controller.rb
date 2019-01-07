module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :destroy, :update]
      def index
        @users = User.all
        render json: @users
      end

      def show
        render json: @user
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        if @user.update_attributes(user_params)
          render json: "updated"
        else
          render json:@user.errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        if @user.destroyed?
          render json: 'destroy successfully'
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email,:password, :avatar, profile_attributes: [:gender, :date_of_birth, :current_city, :mobile_number, :father_name, :current_designation])
      end

      def set_user
        if User.exists?(params[:id])
          @user = User.find(params[:id])
        else
          return head(:forbidden)
        end
      end
    end
  end
end
