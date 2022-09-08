class MapHashtagRelation < ApplicationRecord
    belongs_to :map
    belongs_to :hashtag
    with_options presence: true do
      validates :map_id
      validates :hashtag_id
    end
end
