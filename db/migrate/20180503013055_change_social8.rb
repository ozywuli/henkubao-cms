class ChangeSocial8 < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :settings,
      :social,
      from: {},
      to: {
        '0': { 'name': 'twitter', 'url': 'https://twitter.com' }
      }
    )
  end
end
