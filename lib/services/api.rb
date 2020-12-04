class StockLookup::API
    APIKEY = '222cefa92294adb67b9d8071413d6f1b'
    BASEURL = 'https://financialmodelingprep.com/api/v3/'
    #Gets both the stock symbol and company name
    def self.search(input)
        url = BASEURL + "search?query=#{input}&limit=1&exchange=NASDAQ&apikey=#{APIKEY}"
        
        response = HTTParty.get(url)
    
        if response[0] != nil
            symbol = response[0]["symbol"]
            name = response[0]["name"]
            stock = Stock.find_by_sym(symbol)
            stock.nil? ? Stock.new(name: name, symbol: symbol) : stock
        else 
            nil
        end
    end 

    #Uses the stock symbol that is retreived in Stocks::API.search to get stock quote information
    def self.quote(sym)
        stock = Stock.find_by_sym(sym)
        url = BASEURL + "quote/#{sym}?apikey=#{APIKEY}"
        response = HTTParty.get(url)
        stock.quote_data = response[0]
    end
    
    #Uses the stock symbol that is retreived in Stocks::API.search to get stock rating information
    def self.rating(sym)
        stock = Stock.find_by_sym(sym)
        url = BASEURL + "rating/#{sym}?apikey=#{APIKEY}"
        response = HTTParty.get(url)
        stock.rating = response[0]
        stock.get_color_rarity    
    end

end 