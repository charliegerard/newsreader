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
	attr_accessible :name, :url, :user_id
	has_many :articles
	belongs_to :topics
end
