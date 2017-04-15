class Massage < ApplicationRecord
  belongs_to :sender, :class_name => 'ChatUser', foreign_key: 'sender_id'
  belongs_to :reciever, :class_name => 'ChatUser', foreign_key: 'reseiver_id'
end
