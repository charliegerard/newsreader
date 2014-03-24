# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  copy       :text
#  image      :text
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base
	attr_accessible :title, :copy, :image, :author, :url
	belongs_to :sources
end
