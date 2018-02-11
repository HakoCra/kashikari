module V1
  class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]

    # GET /messages
    def index
      @messages = Message.all

      render json: @messages
    end

    # GET /messages/1
    def show
      render json: @message
    end

    # GET /messages/talk/:username
    def talk
      @user = User.where(username: params[:username])
      @messages = Message.where(user: current_user, target: @user).
                  or(Message.where(user: params[:username], target: @user))

      render json: @messages
    end

    # POST /messages
    def create
      target = User.find_by!(username: message_params[:target])
      @message = Message.new(user: current_user, target: target, text: message_params[:text])

      if @message.save
        render json: @message, serializer: V1::MessageSerializer, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /messages/1
    def update
      if @message.update(message_params)
        render json: @message
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end

    # DELETE /messages/1
    def destroy
      @message.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_message
        @message = Message.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def message_params
        params.permit(:target, :text)
      end
  end
end
