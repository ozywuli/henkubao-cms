class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :ford
      t.string :toyota
      t.string :honda
      t.string :bmw
      t.string :volvo

      t.references :garage

      t.timestamps
    end
  end
end
