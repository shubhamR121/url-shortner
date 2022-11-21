class CreateShortUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :short_urls do |t|
      t.string :full
      t.string :short
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
