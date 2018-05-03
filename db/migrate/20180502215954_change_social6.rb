class ChangeSocial6 < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :settings,
      :social,
      from: {},
      to: {
        'items': {
          '0': { 'name': 'twitter', 'url': 'https://twitter.com'}
        }
      }
    )
  end
end
