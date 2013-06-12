class AddListStringToUser < ActiveRecord::Migration
  
  def change
add_column :users, :my_properties, :string 
  end
  
end
