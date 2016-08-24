class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.string :pivotal_ticket_id

      t.timestamps
    end
  end
end
