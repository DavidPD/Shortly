class RenameHashColumn < ActiveRecord::Migration[6.0]
  def change
  	rename_column :shortened_urls, :hash, :short_hash
  end
end
