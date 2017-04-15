class CreateMassages < ActiveRecord::Migration[5.0]
  def change
    create_table :massages do |t|
      t.string :body
      t.belongs_to :sender, :class_name => 'ChatUser'
      t.belongs_to :reciever, :class_name => 'ChatUser'

      t.timestamps
    end
  end
end
