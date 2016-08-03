class AddCurrentAreaToTeam < ActiveRecord::Migration
  def up
    add_column :teams, :integer, :area_id, as: 'current_area'
  end

  def down
    remove_column :teams, :area_id
  end

end
