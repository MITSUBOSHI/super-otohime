class CreateBaseSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :base_songs do |t|
      t.string   :name,        null: false, default: ''
      t.boolean  :has_effect,  null: false, default: false

      t.timestamps
    end
  end
end
