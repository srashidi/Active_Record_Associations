class ChangeDateAndTimeInEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :time, :time
  	change_column :events, :date, :datetime
  end
end
