class CreateAchievments < ActiveRecord::Migration
  def up
    create_table :achievments do |t|
      t.string :description
      t.integer :points

      t.timestamps null: false
    end
  end

  def down
    drop_table :achievments
  end

end
