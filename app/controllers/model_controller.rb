require 'net/http'

class ModelController < ApplicationController
  protect_from_forgery with: :null_session
  @title = "Post requested"

  def new

  end

  def show

  end

  def output
    @title = 'Output ..'
    @content = 'output lala content'

    puts "output parameters.." + params[:user1].to_s

    @output = params[:user1]
  end

   def post_request
     @content = "content value"
   #  @content = "new content value"
     if request.post?
       @content = "new content value"
       puts "content value: " + @content
        puts " post request received"
        puts "output_to_s: " + params[:user1].to_s
     else
       puts " post request to be sent"
       data = { user: {
            model: 'model1',
            input: 'input1'
         }
       }

 ##    http = Net::HTTP.new(uri.host, uri.port)
     http = Net::HTTP.new('localhost', '3001')

     request = Net::HTTP::Post.new("/input", {'Content-Type' => 'application/json'})
     request.body = data.to_json

   uri = URI('localhost')
   res = http.start() do |http|
     http.request(request)
   end
   @output = nil

   case res
     when Net::HTTPSuccess, Net::HTTPRedirection
       # OK
       puts "SUCCESS"
       # popup waiting screen
     else
       # popup error screen
       puts res.body.to_s
   end

     return res
   end
   end

  helper_method :post_request

end
