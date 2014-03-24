class AddTopicIdToSources < ActiveRecord::Migration
  def change
  	add_column :sources, :topic_id, :integer
  end
end
