class CreateSocialAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :social_addresses do |t|
      t.text :name
      t.text :url

      t.timestamps
    end
  end
end
