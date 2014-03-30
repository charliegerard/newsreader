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

	validates :url, uniqueness: true

    def get_rss
        #self refers to the instance of the source class that you are calling the get_rss method on;
        sloppy_url = self.url
        rss = Feedbag.find(sloppy_url).first
        feeds = Feedjira::Feed.fetch_and_parse(rss)
        @response = HTTParty.get (rss)
    end
end
