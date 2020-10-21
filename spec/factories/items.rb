FactoryBot.define do
  factory :item do
    name              {"あいうえお"}
    category_id       {1}
    condition_id      {1}
    postage_id        {1}
    shipping_days_id  {1}
    prefecture_id     {1}
    price             {10000}
    description       {"aaa"}
    user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test.jpg'), filename: 'test.jpg', content_type: 'image/jpg')
    end
  end
end
