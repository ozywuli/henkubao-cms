class AddSettingIdToSocialAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :social_addresses, :setting, foreign_key: true
  end
end
