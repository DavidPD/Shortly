class AddShortHashIndex < ActiveRecord::Migration[6.0]
  def change
  	add_index :shortened_urls, :short_hash, unique: true
  end
end
