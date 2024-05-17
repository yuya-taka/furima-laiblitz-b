class DeliveryDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },   # ←こちらに注目しましょう
    { id: 2, name: '1~2日で配送' },
    { id: 3, name: '2~3日で配送' },
    { id: 4, name: '4~7日で配送' }
  ]

 
   include ActiveHash::Associations
   has_many :items
  
end