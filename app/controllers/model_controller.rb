require 'rubygems'
require 'faraday'
require 'open-uri'

class ModelController < ApplicationController
  protect_from_forgery with: :null_session
  @title = "Post requested"
  @content = "empty content"
  @output = nil

  def new

  end

  def show

  end

   def post_request
     if request.post?
       puts "computed output: " + params[:user1].to_s
       $output = params[:user1].to_s
     else
       #start popup
       puts "post request to be sent"
       data = { user: {
            model: 'model1',
            input: 'input1'
            },
                user2: {
                    model: 'model1',
                    input: 'input1'
                },
                user3: {
                    model: 'model1',
                    input: 'input1'
                },
                user4: {
                    model: 'model1',
                    input: 'input1'
                },
                user5: {
                    model: 'model1',
                    input: 'input1',
                    model1: 'model1',
                    input1: 'input1',
                    model2: 'model1',
                    input2: 'input1',
                    model3: 'model1',
                    input3: 'input1',
                    model4: 'model1',
                    input4: 'input1',
                    model5: 'model1',
                    input5: 'input1',
                    user2: {
                        model: 'model1',
                        input: 'input1'
                    },
                    user3: {
                        model: 'model1',
                        input: 'input1'
                    },
                    user4: {
                        model: 'model1',
                        input: 'input1'
                    },
                    user5: {
                        model: 'model1',
                        input: 'input1',
                        model1: 'model1',
                        input1: 'input1',
                        model2: 'model1',
                        input2: 'input1',
                        model3: 'model1',
                        input3: 'input1',
                        model4: 'model1',
                        input4: 'input1',
                        model5: 'model1',
                        input5: 'input1'
                    }
                }

       }

       connection = Faraday.new
       
=begin
       conn = Faraday.new('http://localhost:3001') do |f|
         f.request :multipart
         f.request :url_encoded
         f.adapter :net_http # This is what ended up making it work
       end

       payload = { :file => Faraday::UploadIO.new('C:\Users\ef\Documents\rubyProg\prototype1\app\assets\images\field1.jpg', 'image/jpeg') }

       result = conn.post('/input', payload)
=end

       result = connection.post do |req|
         req.url 'http://localhost:3001/input'
         req.headers['Content-Type'] = 'application/json'
         req.body = data.to_json
       end


       if result.success?
         puts "SUCCESS"

         if !$output.nil? && !$output.blank?
           #end popup
           puts "content value is set to: " + $output
           @content = $output
         else
           flash[:danger] = 'Model\'s parameter could not be parsed'
         end
       else
         flash[:danger] = 'Model computation is not available'
       end
   end
   end

  helper_method :post_request
end
