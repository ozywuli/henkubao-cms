class HardcodeSocial < ActiveRecord::Migration[5.2]
  def change
    create_table :socialUrl do |t|
      t.string :twitterUrl
      t.string :facebookUrl
      t.string :tumblrUrl
      t.string :googleplusUrl
      t.string :instagramUrl
    end
  end
end
