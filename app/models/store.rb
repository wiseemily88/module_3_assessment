class Store

  def initialize(attrs = {})
    @long_name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone_number = attrs[:phone]
    @store_type = attrs[:storeType]
  end

  def self.all_by_zip(zip)
    service.get_json.map do |raw_data|
      Store.new(raw_data)
    end

  end

  private

  def self.service
    BestBuyService.new
  end


end
