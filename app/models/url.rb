class Url < ApplicationRecord
	validates :original_url, presence: true 
	after_create :generate_short_url

	def generate_short_url
		chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
    
    	short_url = 4.times.map{chars.sample}.join
    	short_url = short_url + self.id.to_s(36)
    	self.update_attributes(:short_url=>short_url)
    	
	end
end
