module Api
  module V1
    class SongsController < ApplicationController

      def index
        base_song_id = Toilet.find(params[:toilets_id])[:current_base_song_id]
        @level = Toilet.return_proper_level(params[:toilets_id])
        song = BaseSong.find(base_song_id)
        @code = song.present? ? song[:song_code] : ""
      end
    end
  end
end
