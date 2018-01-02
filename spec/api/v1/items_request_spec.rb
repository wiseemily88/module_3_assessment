require 'rails_helper'
describe 'Items Api' do
  it 'sends a list of all items' do
    create_list(:item, 4)

  get '/api/v1/items'

  expect(response).to be_success

  items = JSON.parse(response.body)

  expect(items.count).to eq(4)
  
  end



end
