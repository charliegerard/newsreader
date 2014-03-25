# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  email_address :string(255)
#  photo         :text
#  created_at    :datetime
#  updated_at    :datetime
#

class User < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :email_address, :photo, :topic_ids, :password, :password_confirmation 
	has_many :topics
	has_and_belongs_to_many :sources

	has_secure_password
	validates :photo, :presence => true #the user must have an image, the account will not be created without
	validates :first_name, :presence => true, :uniqueness => true, :length => { :minimum => 2 }
	validates :last_name, :presence => true, :uniqueness => true, :length => { :minimum => 2 }
end
