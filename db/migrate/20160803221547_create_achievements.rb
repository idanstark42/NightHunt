class CreateAchievements < ActiveRecord::Migration
  def up
    create_table :achievements do |t|
      t.string :description
      t.integer :points

      t.timestamps null: false
    end
  end

  def down
    drop_table :achievements
  end

end
