class AddSpamAndArchiveAndTrashFlagsToEmails < ActiveRecord::Migration[7.0]
  def change
    add_column :emails, :spam, :boolean
    add_column :emails, :trash, :boolean
    add_column :emails, :archive, :boolean
  end
end
