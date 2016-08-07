class AddColorToTeam < ActiveRecord::Migration
  def up
    add_column :teams, :color, :string
  end

  def down
    remove_column :teams, :color
  end

end
