class AddMetaSocialToSettings < ActiveRecord::Migration[5.2]
  def change
    change_table :settings do |t|
      t.text :metaSocial
    end
  end
end
