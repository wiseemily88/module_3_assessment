class BestBuyService
  attr_reader :get_json

  def initialize(zipcode)

    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=storeId,storeType,longName,phone,distance,city&pageSize=10&apiKey=#{ENV['api_key']}"
    @get_json = JSON.parse(response.body, symbolize_names: true)[:stores]

    # @conn = Faraday.get(url: "https://api.bestbuy.com/v1/stores(area(80202,25))") do |faraday|
    # faraday.headers["apiKey"] = ENV["api_key"]
    # faraday.headers["format"] = 'json'
    # faraday.headers["show"] = "storeId,storeType,longName,phone,distance,city"
    # faraday.headers["pageSize"] = '10'
    # faraday.adapter Faraday.default_adapter
    # response = Faraday.get "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,phone,distance,city&pageSize=10&apiKey=ENV["api_key"]"
    # JSON.parse(response.body, symbolize_names: true)

end

# def area_search(zip)
#    get_json("(area(#{zip}, 25))")
#  end

 private
   attr_reader :conn

   # def get_json(url)
   #   response = conn.get(url)
   #   JSON.parse(response.body, symbolize_names: true)
   # end
end
