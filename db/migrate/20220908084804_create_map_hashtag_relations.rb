class CreateMapHashtagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :map_hashtag_relations do |t|
      t.references :map, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
