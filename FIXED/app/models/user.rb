class User < ActiveRecord::Base
  has_many :sent_transactions, foreign_key: "sender_id", class_name: "Transaction"
  has_many :received_transactions, foreign_key: "recipient_id", class_name: "Transaction"
  has_many :sent_requests, foreign_key: "sender_id", class_name: "Request"
  has_many :received_requests, foreign_key: "recipient_id", class_name: "Request"

  has_many :bank_accounts
end