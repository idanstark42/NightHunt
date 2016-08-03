class CreateAchievmentSuccesses < ActiveRecord::Migration
  def change
    create_table :achievment_successes do |t|
      t.references :achievment, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
