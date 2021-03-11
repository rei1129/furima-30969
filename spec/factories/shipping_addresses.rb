FactoryBot.define do
  factory :shipping_address do
      postal_code { '100-1000' }
      prefecture_id { 2 }
      municipality { '東京都' }
      address { '練馬区' }
      building_name { '練馬はうす' }
      phone_number { '09012345678' }
      token { 'tok_abcdefghijk12345678900000000' }
  end
end
