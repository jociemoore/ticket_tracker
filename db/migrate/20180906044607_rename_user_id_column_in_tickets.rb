class RenameUserIdColumnInTickets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :user_id, :creator
  end
end
