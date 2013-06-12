class CreateMContacts < ActiveRecord::Migration
  def change
    create_table :m_contacts,:primary_key => :user_id do |t|
      t.integer :user_id
      t.string :contant
      t.string :email

      t.timestamps
    end
  end
end
