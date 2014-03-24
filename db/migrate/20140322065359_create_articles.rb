class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :copy
      t.text :image
      t.string :author
      t.text :url
      t.timestamps
    end
  end
end
