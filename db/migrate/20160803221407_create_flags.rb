class CreateFlags < ActiveRecord::Migration
  def up
    create_table :flags do |t|
      t.string :code
      t.references :area, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :flags
  end

end
