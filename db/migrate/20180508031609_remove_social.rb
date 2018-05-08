class RemoveSocial < ActiveRecord::Migration[5.2]
  def change
    remove_column :settings, :social, :json
  end
end
