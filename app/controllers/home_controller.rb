class HomeController < ApplicationController

    def index
    end

    def convert
        number_string = params[:number_string]
        if number_string.include?("\"")
            num_arr = (number_string.gsub("\"", " ")).split(' ,')
        else
            num_arr = number_string.split(',')
        end
        @converted_number = []
        @invalid_input = 0
        
        num_arr.each do |str|
            if (str.strip).start_with?("\\n") || (str.strip).end_with?("\\n")
                @invalid_input = 1
                break;
            end
            @converted_number.push(add_number(str))
        end
    end
    
    def add_number(str)
        if str.include?('\n')
            str = str.gsub("\\n",",")
        end
        
        if (str.include?('/;')) || (str.include?(';'))
            str = str.gsub("/;",",")
            str = str.gsub(";",",")
        end
        if str.include?(',')
            str = str.split(',')
            sum = 0
            str.map{|x| sum = sum + (x.to_i)}
            return sum
        else
            if str.to_i >= 0
                return str.to_i 
            else
                return "Negative numbers not allowed #{str.to_i}"
            end
        end
    end
end
