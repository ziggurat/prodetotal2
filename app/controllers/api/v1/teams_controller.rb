module Api
  module V1
    class TeamsController < ApplicationController
      def index
        @teams = Team.all
      end

      def show
        @team = Team.find(params[:team_id])
      end

      def create
        @team = Team.new(team_params)

        if @team.save
          render json: @team, status: :created
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      def update
        @team = Team.find(params[:team_id])

        if @team.update_attributes(team_params)
          render json: @team, status: :ok
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @team = Team.find(params[:id])
        @team.destroy

        head :no_content
      end

      private

      def team_params
        params.permit(:name, :key)
      end
    end
  end
end
