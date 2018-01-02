require 'rails_helper'
describe 'Items Api' do
  it 'sends a list of all items' do
    create_list(:item, 4)

  get '/api/v1/items'

  expect(response).to be_success

  items = JSON.parse(response.body)

  expect(items.count).to eq(4)
  end

  it 'can return one item with a matching id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_success

     item = JSON.parse(response.body)

     expect(item["id"]).to eq(id)
   end 



end
