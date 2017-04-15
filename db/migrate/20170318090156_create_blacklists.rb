class CreateBlacklists < ActiveRecord::Migration[5.0]
  def change
    create_table :blacklist do |t|
      t.belongs_to :user, :class_name => 'ChatUser'
      t.timestamps
    end
  end
end
