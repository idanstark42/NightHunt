class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.string :code
      t.references :area, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
