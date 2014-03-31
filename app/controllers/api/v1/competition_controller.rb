class Api::V1::CompetitionController < ApplicationController
	
	def index
		@competitions = Competition.all   
	end

	def show
		@competition = Competition.find(params[:competition_id])
	end

	def create
		@competition = Competition.new(competition_params)
		
		if @competition.save			
			render json: @competition, status: :created
		else			
			render json: @competition.errors, status: :unprocessable_entity
		end
	end

	def update
		@competition = Competition.find(params[:competition_id])

		if @competition.update_attributes(competition_params)
			render json: @competition, status: :ok
		else
			render json: @competition.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@competition = Competition.find(params[:id])
		@competition.destroy

		head :no_content
	end

	private
	def competition_params
		params.permit(:exact_match_points, :result_match_points, :no_match_points, :no_forecast_points, :name, :start_date, :end_date)
	end

end