class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def show
        gym = Gym.find_by(id: params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find_by(id: params[:id])
        gym.destroy
        head :no_content
    end

    private 

    def render_not_found_response
        render json: {"error": "Gym not found"}, status: :not_found
    end
end

