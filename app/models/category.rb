class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: 'コスメ・香水・美容' },
    { id: 9, name: '家電・スマホ・カメラ' },
    { id: 10, name: 'スポーツ・レジャー' },
    { id: 11, name: 'ハンドメイド' },
    { id: 12, name: 'チケット' },
    { id: 13, name: '自動車・オートバイ' },
    { id: 14, name: 'その他' }
]

  include ActiveHash::Associations
  has_many :items
end
