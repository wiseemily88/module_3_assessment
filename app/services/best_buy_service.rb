class BestBuyService
  
  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1/") do |faraday|
      faraday.params["apiKey"] = ENV["api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_stores(zipcode)
    response = conn.get "stores(area(#{zipcode},25))", filter
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :conn, :filter
  def filter
    {
      format: 'json',
      pageSize: 10,
      show: 'longName,city,distance,storeType,phone',
    }
  end
end
