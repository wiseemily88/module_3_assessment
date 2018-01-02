require 'rails_helper'
describe 'Items Api' do
  it 'sends a list of all items' do
    create_list(:item, 4)

  get '/api/v1/items'

  expect(response).to be_success
  expect(response).to have_http_status(200)

  items = JSON.parse(response.body)

  expect(items.count).to eq(4)
  end

  it 'can return one item with a matching id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_success
    expect(response).to have_http_status(200)

     item = JSON.parse(response.body)

     expect(item["id"]).to eq(id)
   end

   it 'can delete an existing item' do
     item = create(:item)

     expect(Item.count).to eq(1)

     delete "/api/v1/items/#{item.id}"

     expect(Item.count).to eq(0)
     expect(response).to have_http_status(204)
   end

end
