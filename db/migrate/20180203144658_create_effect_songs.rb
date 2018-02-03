class CreateEffectSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :effect_songs do |t|
      t.references  :base_song, index: true, foreign_key: true
      t.integer     :level
      t.string      :path

      t.timestamps
    end
  end
end
