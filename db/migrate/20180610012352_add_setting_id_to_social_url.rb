class AddSettingIdToSocialUrl < ActiveRecord::Migration[5.2]
  def change
    add_reference :socialUrl, :setting, foreign_key: true
  end
end
