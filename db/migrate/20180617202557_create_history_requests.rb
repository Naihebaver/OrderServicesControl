class CreateHistoryRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :history_requests do |t|
      t.integer :user_id
      t.integer :invoice_number
      t.integer :phone_number

      t.timestamps
    end
  end
end
