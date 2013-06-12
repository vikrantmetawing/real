class CreateContactpeople < ActiveRecord::Migration
  def change
    create_table :contactpeople do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :message

      t.timestamps
    end
  end
end
