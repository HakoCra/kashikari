module V1
  class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :update, :destroy, :accept]

    # GET /requests
    def index
      @requests = Request.all

      render json: @requests
    end

    # GET /requests/1
    def show
      render json: @request
    end

    # POST /requests
    def create
      @request = Request.new(request_params)
      @request.user = current_user

      if @request.save
        render json: @request, status: :created
      else
        render json: @request.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /requests/1
    def update
      if @request.update(request_params)
        render json: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
    end

    # DELETE /requests/1
    def destroy
      @request.destroy
    end

    def accept
      @accepted_user = AcceptedUser.new(user: current_user, request: @request)

      if @accepted_user.save!
        render json: {"status": 200 }
      else
        render json: {"status": 400 }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_request
        @request = Request.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def request_params
        params.require(:request).permit(:title, :timelimit, :reward, :comment, :user_id)
      end
  end
end
