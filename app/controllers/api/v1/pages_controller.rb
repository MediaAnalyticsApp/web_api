module Api
  module V1
    class PagesController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: :index
      
      # GET /pages.json  | GET http://localhost:3000/api/v1/pages.json?start_date=2018-02-08&end_date=2018-02-11
      def index
        
        if params[:start_date] && params[:end_date]
          @pages = Page.where(found_date_time: params[:start_date]..params[:end_date])
        else
          @pages = Page.order('id DESC')
        end
      end

      # GET /pages/1.json
      def show
        @page = Page.find(params[:id])
      end



      # GET /pages/new
      def new
      end

      # GET /pages/1/edit
      def edit
      end

      # POST /pages.json
      def create
        @page = Page.new(post_params)
        if @page.save
          render status: :created
        else
          render json: @page.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /pages/1.json
      def update
        @page = Page.find(params[:id])
        if @page.update(post_params) 
          render status: :ok
        else
          render json: @page.errors, status: :unprocessable_entity 
        end
      end

      # DELETE /pages/1.json
      def destroy
        @page = Page.find(params[:id])
        if @page
          @page.destroy
        else
          render json: {page: "not found"}, status: :not_found
        end
      end

      private
      def post_params
        params.require(:page).permit(:url, :found_date_time, :last_scan_date)
      end
      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by(token: token)
        end
      end
    end
  end
end