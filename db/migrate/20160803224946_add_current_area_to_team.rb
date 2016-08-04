class AddCurrentAreaToTeam < ActiveRecord::Migration
  def up
    add_column :teams, :area_id, :integer, as: 'current_area'
  end

  def down
    remove_column :teams, :area_id
  end

end
