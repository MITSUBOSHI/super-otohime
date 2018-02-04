class Toilet < ApplicationRecord

  def self.return_proper_level(id)
    formula = current_num_of_using_rooms(id).to_f / sum_rooms(id).to_f
    case formula
    when formula == 0
      level = 0
    when formula <= 0.25
      level = 1
    when formula <= 0.5
      level = 2
    when formula <= 0.75
      level = 3
    when formula = 1.0
      level = 4
    else
      level = 0
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
