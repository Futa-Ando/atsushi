class Hashtag < ApplicationRecord
    validates :hashname, presence: true, length: { maximum:99}
    has_many :map_hashtag_relations
    has_many :maps, through: :map_hashtag_relations
end
