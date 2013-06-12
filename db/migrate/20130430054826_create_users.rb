class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users , :primary_key => :user_id  do |t|
      t.integer :user_id
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
