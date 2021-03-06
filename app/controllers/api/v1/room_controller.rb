module Api
  module V1
    class RoomController < ApplicationController
      skip_before_action :verify_authenticity_token

      def update
        if !params.blank?
          room = Room.where(device_code: params[:device_code])
          if room.present?
            state_id = RoomState.where(is_used: params[:state]).first[:id]
            room.update(room_state_id: state_id)
            render json: { status: :created }
          else
            render json: { status: :unprocessable_entity }
          end
        else
          render json: { status: :unprocessable_entity }
        end
      end

      private
        def params
          params ||= JSON.parse(request.body.read, {:symbolize_names => true})
        end
    end
  end
end
