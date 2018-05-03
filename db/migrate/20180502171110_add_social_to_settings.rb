class AddSocialToSettings < ActiveRecord::Migration[5.2]
  def change
    change_table :posts do |t|
      t.text :social
    end
  end
end
