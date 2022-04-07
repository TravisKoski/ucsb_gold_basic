class AddMajorAndYearToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :major, :string
    add_column :students, :year, :integer
  end
end
