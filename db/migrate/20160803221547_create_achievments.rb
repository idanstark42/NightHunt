class CreateAchievments < ActiveRecord::Migration
  def change
    create_table :achievments do |t|
      t.string :description
      t.integer :points

      t.timestamps null: false
    end
  end
end
