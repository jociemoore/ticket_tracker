class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :body
      t.string :status
      t.timestamps
    end
  end
end
