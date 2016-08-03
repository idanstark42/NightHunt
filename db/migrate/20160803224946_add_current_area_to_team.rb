class AddCurrentAreaToTeam < ActiveRecord::Migration
  def change
    add_column :Team, :integer, :area_id, as: 'current_area'
  end
end
