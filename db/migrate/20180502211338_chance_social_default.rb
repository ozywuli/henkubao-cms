class ChanceSocialDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :settings,
      :social,
      from: {},
      to: "{'name' => 'twitter', 'url' => 'https://twitter.com'}"
    )
  end
end
