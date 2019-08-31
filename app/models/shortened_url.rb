class ShortenedUrl < ApplicationRecord
	validates :long_url, presence: true, url: true
	validates :short_hash, presence: true
end
