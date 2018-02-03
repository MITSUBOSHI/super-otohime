class BaseSong < ApplicationRecord
  has_many   :effect_songs
  has_many   :toilets_base_songs
  has_many   :toilets, through: :base_song_effect_songs

end
