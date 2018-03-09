require 'rubygems'
require 'faraday'
require 'open-uri'

class ModelController < ApplicationController
  protect_from_forgery with: :null_session
  @title = "Post requested"
  @output = nil

  def new

  end

  def show
    if request.post?

      if request.xhr?
        puts "Ajax started in post"
      else
        puts "Ajax did not start in post"
      end

      puts "computed output: " + params[:user1].to_s
      $output = params[:user1].to_s

=begin
      respond_to do |format|
        format.html { redirect_to model_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
=end

     # @content = $output
    else if request.put?

           if request.xhr?
             puts "Ajax started in put"
           else
             puts "Ajax did not start in put"
           end

           puts "post request to be sent"
           data = { user: {
               model: 'model1',
               input: 'input1'
           }
           }

           connection = Faraday.new
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
               @result_showing = true

             else
               flash.now[:danger] = 'Model\'s parameter could not be parsed'
             end
           else
             flash.now[:danger] = 'Model computation is not available'
           end

    else if request.get?
           @result_showing = false

           @content = "  {user: {
  model: 'model1',
  input: 'input1'
  }
  }"

           if request.xhr?
             puts "Ajax started in get"
           else
             puts "Ajax did not start in get"
           end
           end
         end
    end
  end

  def destroy
    puts "delete method found"
    respond_to do |format|
      format.html { redirect_to model_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end

  end

   def post_request
     if request.post?
       puts "computed output: " + params[:user1].to_s
       $output = params[:user1].to_s

       @content = $output
       respond_to do |format|
         puts "before redirect: " + model_path
         format.html { redirect_to model_path }
         format.json { head :no_content }
         format.js   { render :layout => false }
       end
     else
       #start popup

       puts "post request to be sent"
       data = { user: {
            model: 'model1',
            input: 'input1'
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
           flash.now[:danger] = 'Model\'s parameter could not be parsed'
         end
       else
         flash.now[:danger] = 'Model computation is not available'
       end
       respond_to do |format|
         puts "before redirect: " + model_path
         format.html { redirect_to model_path }
         format.json { head :no_content }
         format.js   { render :layout => false }
       end

     end


   end

  helper_method :post_request
end
