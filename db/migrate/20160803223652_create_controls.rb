class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.references :area, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.boolean :isOver

      t.timestamps null: false
    end
  end
end
