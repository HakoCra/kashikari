module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def create
      @user = User.find_for_database_authentication(username: params[:username])
      unless @user
        @user = User.new user_params
        unless @user.save!
          render json: { error: t('user_create_error') }
        end
      end

      if @user.valid_password?(params[:password])
        sign_in :user, @user
        render json: @user, serializer: SessionSerializer, root: nil
      else
        invalid_password
      end
    end

    private

      def user_params
        params.permit(:username, :password)
      end


      def invalid_email
        warden.custom_failure!
        render json: { error: t('invalid_Email') }
      end

      def invalid_password
        warden.custom_failure!
        render json: { error: t('invalid_password') }
      end
  end
end
