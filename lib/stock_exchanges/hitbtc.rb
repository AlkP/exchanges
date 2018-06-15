require 'open-uri'

module StockExchanges
  class Hitbtc
    ASSOCIATIVE_ARRAY = {
      'ask'         =>  'ask',
      'bid'         =>  'bid',
      'last'        =>  'last',
      'open'        =>  'open',
      'low'         =>  'low',
      'high'        =>  'high',
      'volume'      =>  'volume',
      'volumeQuote' =>  'volumeQuote',
      'timestamp'   =>  'rdate',
      'symbol'      =>  'rsymbol'
    }
    attr_reader :courses

    def initialize
      data = get_data
      set_courses(data)
    end

    private

    def get_data
      URI.parse('https://api.hitbtc.com/api/2/public/ticker').read
    end

    def set_courses(data)
      @courses = []
      JSON.parse(data).each do |l|
        @courses << l.map{ |k, v| { ASSOCIATIVE_ARRAY[k] => k == 'timestamp' ? v.to_date : v } }.reduce(:merge)
      end
    end
  end
end