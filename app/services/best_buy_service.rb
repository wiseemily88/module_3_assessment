class BestBuyService

  def initialize
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,phone,distance,city&pageSize=10&apiKey=hhp47b5bvjda7pj44gsauf78"
    JSON.parse(response.body)
    JSON.parse(response.body)["total"]
byebug
  end
end
