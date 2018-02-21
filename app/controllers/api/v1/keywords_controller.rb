module Api
  module V1
    class KeywordsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: :index

      # GET /keywords.json
      def index
        @keywords = Keyword.order('id DESC')
      end

      # GET /keywords/1.json
      def show
        @keyword = Keyword.find(params[:id])
      end

      # GET /keywords/new
      def new
      end

      # GET /keywords/1/edit
      def edit
      end

      # POST /keywords.json
      def create
        @keyword = Keyword.new(keyword_params)
        if @keyword.save
          render status: :created
        else
          render json: @keyword.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /keywords/1.json
      def update
        @keyword = Keyword.find(params[:id])
        if @keyword.update(post_params)
          render status: :ok
        else
          render json: @keyword.errors, status: :unprocessable_entity 
        end
      end

      # DELETE /keywords/1.json
      def destroy
        @keyword = Keyword.find(params[:id])
        if @keyword
          @keyword.destroy
        else
          render json: {keyword: "not found"}, status: :not_found
        end
      end

      private
      def post_params
        params.require(:keyword).permit(:name, :person_id)
      end

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by(token: token)
        end
      end
    end
  end
end