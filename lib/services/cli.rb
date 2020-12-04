class StockLookup::CLI
    def call
        puts "Welcome to Stock Quotes"
        puts "\n---------------------------------"
        main_menu
    end 

    def main_menu
        puts "\n---Main Menu---"  
        puts "1. Search a Stock"
        puts "2. Exit"
        input = gets.chomp
        puts "\n--------------------------------"
        if input == '1'
            stock_lookup_menu
        elsif input == '2' || input.downcase.include?('ex')
            terminate
        else 
            puts "Not Valid Input"
            main_menu 
        end 
    end

    def stock_lookup_menu
        puts "\n---Stock Information---"
        print "\nEnter a Stock Name or Symbol: "
        input = gets.chomp 
        stock_lookup(input)
    end

    def stock_lookup(search_query)
        stock = StockLookup::API.search(search_query)
        #If StockLookup::API.search yields a result =>
        if stock != nil
            get_stock_quote_and_rating(stock.symbol)
        #In case user decides they want to exit instead of using a stock symbol
        elsif search_query.downcase.include?('exit')
            terminate
        #Keep looping until user enters valid company name or symbol
        else 
            puts "\nStock Name or Symbol Not Valid".redish
            stock_lookup_menu
        end
    end 

    def get_stock_quote_and_rating(stock_symbol)
        StockLookup::API.quote(stock_symbol)
        StockLookup::API.rating(stock_symbol)
        stock_information(stock_symbol)
    end

    def stock_information(sym)
        
        stock = Stock.find_by_sym(sym)
        quote = stock.quote_data
        rating = stock.rating
        
        puts "\n--------------------------------"
        puts "\n#{stock.name} (#{stock.symbol})"
        puts "\nQuote".white
        puts "Current Price: #{quote["price"].round(2)}"
        puts "High: #{quote["dayHigh"].round(2)}"
        puts "Low: #{quote["dayLow"].round(2)}"
        puts "52wk High: #{quote["yearHigh"].round(2)}"
        puts "52wk Low: #{quote["yearLow"].round(2)}"
        puts "Previous Close: #{quote["previousClose"].round(2)}"
        puts "Open: #{quote["open"].round(2)}"
        #.send(stock.rating_color.to_sym) is so that awesome_print will change the color of output
        puts "\nRating: #{rating["ratingRecommendation"]}".send(stock.rating_color.to_sym)
        puts "\n--------------------------------"
        main_menu
    end

    def terminate
        puts 'Goodbye...'
        exit
    end 

end 