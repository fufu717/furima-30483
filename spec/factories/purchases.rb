FactoryBot.define do
  factory :order do
    token              {'tok_00000000000000'}
    postal_code        {'111-1111'}
    prefecture_id      {1}
    city               {'目黒区'}
    address            {'目黒本町1-1-1'}
    building           {''}
    phone              {'09011111111'}
  end
end
