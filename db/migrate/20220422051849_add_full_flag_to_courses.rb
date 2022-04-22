class AddFullFlagToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :isFull, :boolean
  end
end
