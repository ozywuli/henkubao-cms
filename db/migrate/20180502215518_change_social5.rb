class ChangeSocial5 < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :settings,
      :social,
      from: {},
      to: {'items': [{'id': 123456, 'name': 'twitter', 'url': 'https://twitter.com'}]}
    )
  end
end
