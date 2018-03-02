module Api
  module V1
    class SitesController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: [:index, :show, :new, :edit, :create, :update, :destroy]
      
      # GET /sites.json
      def index
        @sites = Site.order('id DESC')
      end

      # GET /sites/1.json
      def show
        @site = Site.find(params[:id])
      end

      # GET /sites/new
      def new
      end

      # GET /sites/1/edit
      def edit
      end

      # POST /sites.json
      def create
        @site = Site.new(post_params)
        if @site.save
          render status: :created
        else
          render json: @site.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /sites/1.json
      def update
        @site = Site.find(params[:id])
        if @site.update(post_params) 
          render status: :ok
        else
          render json: @site.errors, status: :unprocessable_entity 
        end
      end

      # DELETE /sites/1.json
      def destroy
        @site = Site.find(params[:id])
        if @site
          @site.destroy
        else
          render json: {site: "not found"}, status: :not_found
        end
      end

      private
      def post_params
        params.require(:site).permit(:name)
      end
      
      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by(token: token)
        end
      end
    end
  end
end