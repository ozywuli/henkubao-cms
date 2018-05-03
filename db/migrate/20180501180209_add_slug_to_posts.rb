class AddSlugToPosts < ActiveRecord::Migration[5.2]
  def change
    change_table :posts do |t|
      t.string :slug
    end
  end
end
