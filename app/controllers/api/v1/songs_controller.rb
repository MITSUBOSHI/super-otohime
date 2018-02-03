module Api
  module V1
    class SongsController < ApplicationController

      def index
        raise
        base_song_id = Toilet.find(params[:toilets_id])[:current_base_song_id]
        song = EffectSong
          .where(base_song_id: base_song_id)
          .where(level: 1)
          .first
        @path = song.present? ? song[:path] : ""
        @level = song.present? ? song[:level] : 0
      end
    end
  end
end
