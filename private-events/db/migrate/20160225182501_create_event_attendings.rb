class CreateEventAttendings < ActiveRecord::Migration
  def change
    create_table :event_attendings do |t|
      t.integer :attended_event_id
      t.integer :event_attendee_id

      t.timestamps null: false
    end
  end
end
