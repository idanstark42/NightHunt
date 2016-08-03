class CreateTeams < ActiveRecord::Migration
  def up
    create_table :teams do |t|
      t.string :name
      t.string :password_digest
      t.integer :points

      t.timestamps null: false
    end
  end

  def down
    drop_table :teams
  end

end
