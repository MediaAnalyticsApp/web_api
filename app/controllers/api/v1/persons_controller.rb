module Api
  module V1
    class PersonsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: :index

      # GET /persons.json
      def index
        @persons = Person.order('id DESC')
      end

      # GET /persons/1.json
      def show
        @person = Person.find(params[:id])
      end

      # GET /persons/new
      def new
      end

      # GET /persons/1/edit
      def edit
      end

      # POST /persons.json
      def create
        @person = Person.new(post_params)
        if @person.save
          render status: :created
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /persons/1.json
      def update
        @person = Person.find(params[:id])
        if @person.update(post_params) 
          render status: :ok
        else
          render json: @person.errors, status: :unprocessable_entity 
        end
      end

      # DELETE /persons/1.json
      def destroy
        @person = Person.find(params[:id])
        if @person
          @person.destroy
        else
          render json: {person: "not found"}, status: :not_found
        end
      end

      private
      def post_params
        params.require(:person).permit(:name)
      end

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by(token: token)
        end
      end
    end
  end
end