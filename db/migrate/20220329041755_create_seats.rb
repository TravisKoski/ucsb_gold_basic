class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.belongs_to :Course, null: false, foreign_key: true
      t.belongs_to :Student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
