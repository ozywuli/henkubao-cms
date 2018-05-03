class AddDefaultToSocial < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :settings,
      :metaSocial,
      from: nil,
      to: "{'name' => 'twitter', 'url' => 'https://twitter.com'}"
    )
  end
end
