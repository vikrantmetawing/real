class Addstories < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
add_column :storiesses, :user_id, :integer 
  end
end
