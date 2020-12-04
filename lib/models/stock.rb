class Stock  
    attr_accessor :symbol, :name, :quote_data, :rating, :rating_color
    @@all = []

    def initialize(symbol:, name:)
        @symbol = symbol 
        @name = name 
        @@all << self
    end 

    def self.all 
        @@all 
    end 
    
    def self.find_by_sym(sym)
        self.all.find {|stock| stock.symbol == sym}
    end

    #This is attributing formatting information to instance of stock class for 
    #use with awesome_print
    def get_color_rarity
        if self.rating["ratingRecommendation"].include?('Buy')
            self.rating_color = 'greenish'
        elsif self.rating["ratingRecommendation"] == "Neutral"
            self.rating["ratingRecommendation"] = "Hold"
            self.rating_color = 'yellowish'
        else
            self.rating_color = 'redish'
        end
    end
end