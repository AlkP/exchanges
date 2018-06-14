require 'net/http'

module StockExchange
  class Hitbtc
    def initialize
      url = URI.parse('https://api.hitbtc.com/api/2/public/ticker')
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      puts res.body
    end
  end
end