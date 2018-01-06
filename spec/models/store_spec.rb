require "rails_helper"
describe Store do
  it "can be created with attributes from api call" do
    attributes = {
      :longName=>"Cherry Creek Shopping Center",
       :city=>"Denver",
       :distance=>3.45,
       :storeType=>"Mobile SAS",
       :phone=>"303-270-9189"
    }

  store = Store.new(attributes)

    expect(store).to be_a Store
    expect(store.long_name).to eq("Cherry Creek Shopping Center")
    expect(store.city).to eq("Denver")
    expect(store.distance).to eq(3.45)
    expect(store.store_type).to eq("Mobile SAS")
    expect(store.phone_number).to eq("303-270-9189")
  end
end
