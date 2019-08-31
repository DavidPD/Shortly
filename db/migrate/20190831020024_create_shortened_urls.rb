class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :hash

      t.timestamps
    end
  end
end
