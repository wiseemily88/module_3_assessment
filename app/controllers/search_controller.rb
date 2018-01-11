class SearchController <ApplicationController
  def index
     @presenter = BestBuyStoreSearchPresenter.new(params["search"]) 
  end
end
