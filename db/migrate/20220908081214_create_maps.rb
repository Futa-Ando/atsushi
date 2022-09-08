class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :sns
      t.string :title
      t.string :range1
      t.string :range2
      t.string :caption

      t.timestamps
    end
  end
end
