class RemoveMetasocial < ActiveRecord::Migration[5.2]
  def change
    remove_column :settings, :metaSocial, :text
  end
end
