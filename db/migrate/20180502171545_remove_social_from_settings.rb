class RemoveSocialFromSettings < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :social, :text
  end
end
