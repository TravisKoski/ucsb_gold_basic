class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :sender
      t.string :reciever
      t.text :content
      t.belongs_to :Student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
