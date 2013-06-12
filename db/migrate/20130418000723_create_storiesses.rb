class CreateStoriesses < ActiveRecord::Migration
  def change
    create_table :storiesses do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :story
      t.string :image

      t.timestamps
    end
  end
end
