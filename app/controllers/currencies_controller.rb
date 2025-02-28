class CurrenciesController < ApplicationController
  def home
    render({:template => "/home.html.erb"})
  end 
  
  def first
    
    @exchange_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@exchange_data)
    @symbols_hash = @parsed_data.fetch("symbols").keys
    @array_of_symbols = @symbols_hash

    render({:template => "/exchange_template/step_one.html.erb"})
  end 

  def second
    @exchange_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@exchange_data)
    @symbols_hash = @parsed_data.fetch("symbols").keys
    @array_of_symbols = @symbols_hash

  render({:template => "/exchange_template/step_two.html.erb"})
  end 

  def convert
    @first_currency = params.fetch("first_currency")
    @second_currency = params.fetch("second_currency")
    url = "https://api.exchangerate.host/convert?from=#{@first_currency}&to=#{@second_currency}"
    @raw_data = open(url).read
    @parsed_data_conversion = JSON.parse(@raw_data)
    @rate = @parsed_data_conversion.fetch("info").fetch("rate")
    render({:template => "/exchange_template/convert.html.erb"})
  end

  

end 
