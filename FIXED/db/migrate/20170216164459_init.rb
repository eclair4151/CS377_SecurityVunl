class Init < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :session_id, index: true
      t.text :email
      t.text :first_name
      t.text :last_name
      t.text :password
      t.float :money
      t.timestamps null: false
    end

    create_table :transactions do |t|
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
      t.float :amount
      t.text :message
      t.timestamps null: false
    end

    create_table :requests do |t|
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
      t.float :amount
      t.text :message
      t.timestamps null: false
    end

    create_table :bank_accounts do |t|
      t.integer :user_id, index: true
      t.text :bank_name
      t.text :account_number
      t.text :routing_number
      t.timestamps null: false
    end
  end
end
