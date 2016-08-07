class CreatePuzzlePieces < ActiveRecord::Migration
  def change
    create_table :puzzle_pieces do |t|
      t.integer :x_coord
      t.integer :y_coord
      t.string :image_uri
      t.string :note

      t.timestamps null: false
    end
  end
end
