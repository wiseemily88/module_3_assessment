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

   it 'can create an item' do
     items_params = {name: "New Item", description: "The Best Item", image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"}

     post "/api/v1/items", params: {item: items_params}

     item = Item.last
     expect(response).to have_http_status(201)
     expect(item.name).to eq("New Item")
   end


end
