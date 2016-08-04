class CreateAchievementSuccesses < ActiveRecord::Migration
  def up
    create_table :achievement_successes do |t|
      t.references :achievment, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :achievement_successes
  end

end
