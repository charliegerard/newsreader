# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
	attr_accessible :name, :user_id
	has_many :sources
	has_and_belongs_to_many :users
end
