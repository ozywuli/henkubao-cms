class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :metaTitle
      t.string :metaAuthor
      t.string :metaDescription
      t.string :metaKeywords

      t.timestamps
    end
  end
end
