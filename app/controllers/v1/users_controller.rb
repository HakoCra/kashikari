module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:create]

    def create
      @user = User.new user_params

      if @user.save!
        @beacon = create_beacon!(@user)
        render json: @user, serializer: V1::SessionSerializer, root: nil
      else
        render json: { error: t('user_create_error') }, status: :unprocessable_entity
      end
    end

    private

      def user_params
        params.require(:user).permit(:username, :password)
      end

      def create_beacon!(user)
        major = Random.rand(1000)
        minor = Random.rand(1000)
        while Beacon.exists?(major: major, minor: minor) do
          major = Random.rand(1000)
          minor = Random.rand(1000)
        end
        Beacon.create!(user: user, major: major, minor: minor)
      end
  end
end
