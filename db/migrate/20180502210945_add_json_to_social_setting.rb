class AddJsonToSocialSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :social, :json, default: {}
  end
end
