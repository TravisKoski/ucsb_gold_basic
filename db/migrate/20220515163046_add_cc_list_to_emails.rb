class AddCcListToEmails < ActiveRecord::Migration[7.0]
  def change
    add_column :emails, :ccList, :string
  end
end
