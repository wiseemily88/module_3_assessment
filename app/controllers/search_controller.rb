class SearchController <ApplicationController
  def index
    @stores = BestBuyStoreSearchPresenter.new(params["search"]).all_by_zip
    @total_results = BestBuyStoreSearchPresenter.new(params["search"]).total_results

  end
end
