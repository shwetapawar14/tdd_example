class HomeController < ApplicationController

    def index
    end

    def convert
        number_string = params[:number_string]
        num_arr = number_string.split(',')
        @converted_number = []
        
        num_arr.each do |str|
            @converted_number.push(add_number(str))
        end
    end
    
    def add_number(str)
        if str.include?(',')
            str = str.split(',')
            return str.inject(:+)
        else
            return str.to_i
        end
    end
end
