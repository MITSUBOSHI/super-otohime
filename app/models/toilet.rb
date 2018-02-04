class Toilet < ApplicationRecord
  has_many :toilets_base_songs
  has_many :base_songs, through: :toilets_base_songs

  def self.return_proper_level(id)
    formula = current_num_of_using_rooms(id).to_f / sum_rooms(id).to_f
    case formula
    when 0 then
      level = 0
    when (0..0.3) then
      level = 1
    when (0.31..0.6) then
      level = 2
    when (0.61..0.99)  then
      level = 3
    when 1.0 then
      level = 4
    end
    level
  end

  def self.sum_rooms(id)
    Room.where(toilets_id: id).count
  end

  def self.current_num_of_using_rooms(id)
    true_flag = RoomState.where(is_used: true).first[:id]
    Room.where(toilets_id: id).where(room_state_id: true_flag).count || 0
  end
end
