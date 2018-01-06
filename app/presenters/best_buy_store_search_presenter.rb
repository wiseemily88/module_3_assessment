class BestBuyStoreSearchPresenter

  def initialize(zip)
    @zip = zip
  end

  def all_by_zip
    service.find_stores(zip)[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  def total_results
    service.find_stores(zip)[:total]
  end


  private
  attr_reader :zip

  def service
    BestBuyService.new
  end
end
