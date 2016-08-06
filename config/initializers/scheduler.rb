# This is the scheduler file for the rufus-scheduler gem
require 'rufus-scheduler'

# Initiate the scheduler instance
scheduler = Rufus::Scheduler::singleton

# The points calculation method

scheduler.every '1m' do
  lead = nil
  Team.all.each do |team|
    team.points += team.calculate_points_addition
    team.save
    lead = team if lead == nil || team.points > lead.points
  end
  Rails.logger.debug "Calculated points. leading team: #{lead.name} with #{lead.points} points."
end

