require 'net/http'
require 'json'

def format_api_url(search_term)
    api_key = '0ecdb5d3353b480a803430b5b0c81fb2'
    endpoint = "http://api.giphy.com/v1/gifs/search?q=#{search_term}&api_key=#{api_key}"
end

def call_giphy_api(url)
    # include all the gems needed to use apis in ruby
    
    # open an access point to grab data
    uri = URI(url) # establishes an address to go grab the data with ruby
    data = Net::HTTP.get(uri) # goes to actually get the data
    formatted_data = JSON.parse(data) # convert the data to a ruby hash
    
    # find the right url
    result_array = formatted_data["data"]
    
    gif_url_array = result_array.map do |item|
       item["images"]["fixed_height"]["url"]
    end
    
    gif_url_array    
end