class CreatePuzzlePieceReveals < ActiveRecord::Migration
  def change
    create_table :puzzle_piece_reveals do |t|
      t.references :puzzle_piece, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
