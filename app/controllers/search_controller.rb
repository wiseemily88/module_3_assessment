class SearchController <ApplicationController
  def index
    @stores = Station.all_by_zip(params[:search])
    byebug
  end
end
