require 'net/http'

class ModelController < ApplicationController
  protect_from_forgery with: :null_session
  @title = "Post requested"
  @content = "empty content"
  @output1 = nil

  def new

  end

  def show

  end

   def post_request
     if request.post?
       puts "computed output: " + params[:user1].to_s
       $output1 = params[:user1].to_s
     else
       puts "post request to be sent"
       data = { user: {
            model: 'model1',
            input: 'input1'
         }
       }

     http = Net::HTTP.new('localhost', '3001')

     request = Net::HTTP::Post.new("/input", {'Content-Type' => 'application/json'})
     request.body = data.to_json

   res = http.start() do |http|
     http.request(request)
   end

   case res
     when Net::HTTPSuccess, Net::HTTPRedirection
       puts "SUCCESS"

     if !$output1.nil? && !$output1.blank?
       puts "content value is set to: " + $output1
       @content = $output1
     else
       flash[:danger] = 'Model\'s parameter could not be parsed'
     end
       # popup waiting screen
     else
       flash[:danger] = 'Model computation is not available'
   end
   end
   end

  helper_method :post_request
end
