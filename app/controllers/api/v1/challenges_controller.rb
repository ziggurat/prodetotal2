module Api
  module V1
    class ChallengesController < ApplicationController
      def create
        @challenge = Challenge.new(challenge_params)

        if @challenge.save
          render json: @challenge, status: :created
        else
          render json: @challenge.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
