class CreateRoomStates < ActiveRecord::Migration[5.1]
  def change
    create_table :room_states do |t|
      t.string    :name
      t.boolean   :is_used

      t.timestamps
    end
  end
end
