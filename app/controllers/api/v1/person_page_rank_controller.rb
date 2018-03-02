module Api
  module V1
    class PersonPageRankController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: [:index, :show, :new, :edit, :create, :update, :destroy]
      
      # GET /person_page_rank.json
      def index
        @person_page_rank = PersonPageRank.order('id DESC')
      end

      # GET /person_page_rank/1.json
      def show
        @person_page_rank = PersonPageRank.find(params[:id])
      end

      # GET /person_page_rank/new
      def new
      end

      # GET /person_page_rank/1/edit
      def edit
      end

      # POST /person_page_rank.json
      def create
        @person_page_rank = PersonPageRank.new(post_params)
        if @person_page_rank.save
          render status: :created
        else
          render json: @person_page_rank.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /person_page_rank/1.json
      def update
        @person_page_rank = PersonPageRank.find(params[:id])
        if @person_page_rank.update(post_params) 
          render status: :ok
        else
          render json: @person_page_rank.errors, status: :unprocessable_entity 
        end
      end

      # DELETE /person_page_rank/1.json
      def destroy
        @person_page_rank = PersonPageRank.find(params[:id])
        if @person_page_rank
          @person_page_rank.destroy
        else
          render json: {person_page_rank: "not found"}, status: :not_found
        end
      end

      private
      def post_params
        params.require(:person_page_rank).permit(:rank)
      end
      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by(token: token)
        end
      end
    end
  end
end