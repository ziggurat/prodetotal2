module Api
  module V1
    class MatchesController < ApplicationController
      def matches_for_competition
        @matches = Match.where(competition: params[:competition_id])
      end

      def create
        @match = Match.new(match_params)

        if @match.save
          render json: @match, status: :created
        else
          render json: @match.errors, status: :unprocessable_entity
        end
      end

      def set_score
        @match = Match.where(id: set_score_params[:match_id]).take
        if @match.nil?
          render json: {}, status: 404
        else
          @match.set_score(set_score_params[:local_score], set_score_params[:visitor_score])
          render json: @match
        end
      end

      private

      def match_params
        params.permit(:competition_id, :local_id, :visitor_id, :date)
      end

      def set_score_params
        params.permit(:match_id, :local_score, :visitor_score)
      end
    end
  end
end
