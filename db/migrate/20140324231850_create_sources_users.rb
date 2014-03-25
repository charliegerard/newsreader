class CreateSourcesUsers < ActiveRecord::Migration
  def change
    create_table :sources_users, :id =>false do  |t|
    	t.integer :source_id
    	t.integer :user_id
    end
  end
end
