class CreateAttendedEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :attended_events do |t|
      t.integer :event_id
      t.integer :attendee_id

      t.timestamps
    end
    add_index :attended_events, :event_id
    add_index :attended_events, :attendee_id
    add_index :attended_events, [:event_id, :attendee_id], unique: true
  end
end
