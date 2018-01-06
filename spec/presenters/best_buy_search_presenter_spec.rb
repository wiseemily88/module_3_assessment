require "rails_helper"

describe BestBuyStoreSearchPresenter do
  describe ".all_by_zip" do
    it "returns store objects" do
    presenter = BestBuyStoreSearchPresenter.new("37919")
     stores = presenter.all_by_zip

     expect(stores.first).to be_a Store
   end

   it "returns the first 10 store objects" do
   presenter = BestBuyStoreSearchPresenter.new("80202")
    stores = presenter.all_by_zip

    expect(stores.count).to eq(10)
  end
end

  describe ".total_results" do
    it "returns the total number of results per zip" do
    presenter = BestBuyStoreSearchPresenter.new("80202")
     result = presenter.total_results

     expect(result).to eq(17)
   end
 end 
end
