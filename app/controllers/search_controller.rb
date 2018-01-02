class SearchController <ApplicationController
  def index
    @stores = Store.all_by_zip(params["search"])


  end
end
