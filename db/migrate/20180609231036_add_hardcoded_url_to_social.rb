class AddHardcodedUrlToSocial < ActiveRecord::Migration[5.2]
  def change
    change_table :settings do |t|
      t.string :socialTwitterUrl
      t.string :socialFacebookUrl
      t.string :socialTumblrUrl
      t.string :socialGoogleplusUrl
      t.string :socialInstagramUrl
    end
  end
end
