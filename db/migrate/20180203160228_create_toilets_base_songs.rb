class CreateToiletsBaseSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :toilets_base_songs do |t|
      t.references  :toilets,     index: true, foreign_key: true
      t.references  :base_song,  index: true, foreign_key: true

      t.timestamps
    end
  end
end
