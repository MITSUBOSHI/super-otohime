class CreateToilets < ActiveRecord::Migration[5.1]
  def change
    create_table :toilets do |t|
      t.string      :longitude, null: false, default: ''
      t.string      :latitude,  null: false, default: ''
      t.integer     :floor_no,  null: false, default: 1
      t.integer     :current_base_song_id, default: nil

      t.timestamps
    end
  end
end
