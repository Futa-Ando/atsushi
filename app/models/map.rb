class Map < ApplicationRecord
    geocoded_by :address
    after_validation :geocode

    # 省略

  has_many :map_hashtag_relations
  has_many :hashtags, through: :map_hashtag_relations

  #DBへのコミット直前に実施する
  after_create do
    map = Map.find_by(id: self.id)
    hashtags  = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    map.hashtags = []
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      map.hashtags << tag
    end
  end

  before_update do 
    map = Map.find_by(id: self.id)
    map.hashtags.clear
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      map.hashtags << tag
    end
  end

end