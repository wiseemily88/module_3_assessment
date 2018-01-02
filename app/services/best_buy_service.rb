class BestBuyService

  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1/stores") do |faraday|
    faraday.headers["apiKey"] = ENV["api_key"]
    faraday.headers["format"] = 'json'
    faraday.headers["show"] = "storeId,storeType,longName,phone,distance,city"
    faraday.headers["pageSize"] = '10'
    faraday.adapter Faraday.default_adapter
    # response = Faraday.get "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,phone,distance,city&pageSize=10&apiKey=ENV["api_key"]"
    # JSON.parse(response.body, symbolize_names: true)
    byebug
  end
end
end
