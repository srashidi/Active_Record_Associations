class ChangeDateInEvents < ActiveRecord::Migration
  def change
  	change_column :events, :date, :date
  	add_column :events, :time, :time
  end
end
