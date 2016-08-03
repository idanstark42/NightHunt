class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :x_coord
      t.integer :y_coord
      t.text :riddle_text
      t.string :riddle_answer
      t.integer :points

      t.timestamps null: false
    end
  end
end
