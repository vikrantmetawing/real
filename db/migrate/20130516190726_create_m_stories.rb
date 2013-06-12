class CreateMStories < ActiveRecord::Migration
  def change
    create_table :m_stories,:primary_key => :user_id do |t|
      t.integer :user_id
      t.string :contant

      t.timestamps
    end
  end
end
