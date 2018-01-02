class SearchController <ApplicationController
  def index
    @stations = BestBuyService.new
  end
end
