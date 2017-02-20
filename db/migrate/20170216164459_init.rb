class Init < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :session_id, index: true
      t.text :email
      t.text :password
      t.float :money
      t.timestamps null: false
    end

    create_table :transactions do |t|
      t.integer :sender_id, index: true
      t.integer :requester_id, index: true
      t.float :amount
      t.boolean :fulfilled
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

    create_table :friends do |t|
      t.integer :user_id, index: true
      t.integer :user_id2, index: true
      t.timestamps null: false
    end

  end
end
