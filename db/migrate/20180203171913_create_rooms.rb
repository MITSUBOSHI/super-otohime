class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string      :device_code
      t.references  :toilets, index: true, foreign_key: true
      t.references  :room_state, index: true, foreign_key: true

      t.timestamps
    end
  end
end
