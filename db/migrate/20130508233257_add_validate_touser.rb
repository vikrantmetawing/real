class AddValidateTouser < ActiveRecord::Migration
  def up
  end

  def down
  end
   def change
add_column :users, :validate, :boolean 
  end
end
