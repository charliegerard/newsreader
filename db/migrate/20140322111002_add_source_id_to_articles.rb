class AddSourceIdToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :source_id, :integer
  end
end
