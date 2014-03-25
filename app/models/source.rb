# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Source < ActiveRecord::Base
	attr_accessible :name, :url, :user_ids
	has_many :articles
	belongs_to :topics
	has_and_belongs_to_many :users
end
