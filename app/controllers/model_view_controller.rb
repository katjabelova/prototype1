require 'rubygems'
require 'faraday'
require 'open-uri'
require 'json'


class ModelViewController < ApplicationController
  protect_from_forgery with: :null_session
#  after_action :parse_json

  @title = "Post requested"
  @output = nil
  @outputArray = nil
  @ready = false
  @user_id = 0
  @model_id = 0

  def new
  end

  def subchoice
    @tabChosen = params[:tabChosen]
    puts "tab chosen: " + @tabChosen.to_s
    head :no_content
  end

  def show_questionnaire
    @tempQuestion = ParseQuestionnaire.new(3)
    @question = @tempQuestion.questions_array
    @subquestion = ParseQuestionnaire.new(3).subquestions_array
  end

  def show_questionnaire2
    logger.debug "HERE IS DEBUG"

    @user = current_user
    @user_id = @user != nil ? @user.id : 0
    @model_id = 3

    protocolLogger = LoggingProtocolHelper.new(self.class.name, __method__, '', @model_id, @user_id)

    @tempQuestion = ParseQuestionnaire.new(3)
    @question = @tempQuestion.questions_array
    @subquestion = ParseQuestionnaire.new(3).subquestions_array
  end

  def finish_questionnaire
    if request.post?
      puts "computed output: " + params[:output].to_s

  #    @output = params[:output]
  #    $output  = @output

      puts "end of post request"

    else if request.get?
      @user = current_user
      @user_id = @user != nil ? @user.id : 0
      @model_id = 3

      puts "params: " + params.to_s
      puts "model_id: " + @model_id.to_s + ", user_id: " + @user_id.to_s

      @inputToSend = {}
      @inputToSend['user_id'] = @user_id
      @inputToSend['model_id'] = @model_id
      @inputToSend['params'] = params.to_json

      puts "params to send: " + @inputToSend.to_s

      @content = { agro_split: {
                 model_name: 'first',
                 input1: @inputToSend } }

      connection = Faraday.new
      result = connection.post do |req|
        req.url 'http://localhost:3001/input'
        req.headers['Content-Type'] = 'application/json'
        req.body = @content.to_json
      end

      if result.success?

        puts "SUCCESS"
        puts "ooooouuuuuttttt: " + @output.to_s

        if !$output.nil? && !$output.blank?

         puts "content value is set to: " + $output.to_s

         parse_json
         @name = "Sent"

        else
          flash.now[:danger] = 'Model\'s parameter could not be parsed'
        end
      else
        flash.now[:danger] = 'Model computation is not available'
      end

      end
    end

=begin
      ready = false

        @input1 = params[:show][:title1]
        @input2 = params[:show][:title2]

        puts "1: " + @input1.to_s + "; 2: " + @input2.to_s

          if @input1.to_s != "" && @input2.to_s != ""
           puts "post request to be sent"
           @content = { agro_split: {
                      model_name: 'first',
                      input1: @input1,
                      input2: @input2  } }

           data = @content

           connection = Faraday.new
           result = connection.post do |req|
             req.url 'http://localhost:3001/input'
             req.headers['Content-Type'] = 'application/json'
             req.body = @content.to_json
           end

           if result.success?

             puts "SUCCESS"
             puts "ooooouuuuuttttt: " + @output.to_s

             if !$output.nil? && !$output.blank?

              puts "content value is set to: " + $output.to_s

              parse_json
              @name = "Sent"

             else
               flash.now[:danger] = 'Model\'s parameter could not be parsed'
             end
           else
             flash.now[:danger] = 'Model computation is not available'
           end
=end

  end

  def parse_json
    if !$output.nil?
      puts "output shown: " + $output.to_s
      @outputArray = []

      outputToJSON = $output.to_json
      puts "before parse: " + outputToJSON
      $output = JSON.parse(outputToJSON)

      $output.each_with_index { |value, index|
        puts "print1 print1: " + value[1].to_s
        hash = value[1]
      #  @parsedChart = ParseJson.new(hash)
      #  @outputArray[index] = @parsedChart
        @outputArray[index] = ParseJson.new(hash)
      }

      @ready = true
    #  render :js => "updateChart1();"
=begin
      respond_to do |format|
        format.html { render :js => "updateChart();"}
        format.js { render :js => "updateChart();"}
      end
=end
    #  redirect_to (:show), :notice => "redirection" and return
    #  @parsedChart = ParseJson.new(@output)
    #  puts "output before parsing: " + @output.to_s
    #  puts "chart parsed: " + @parsedChart.to_s
    else
      return
    end
  end

  def show
    if request.post?
      puts "computed output: " + params[:output].to_s
    #  puts "computed params" + params.to_s
      @output = params[:output]
      $output  = @output
    #  parse_json
      #render :js => "window.updateChart();"

      puts "end of post request"

    else if request.put?
        ready = false
        @input1 = params[:show][:title1]
        @input2 = params[:show][:title2]

        puts "1: " + @input1.to_s + "; 2: " + @input2.to_s

          if @input1.to_s != "" && @input2.to_s != ""
           puts "post request to be sent"
           @content = { agro_split: {
                      model_name: 'first',
                      input1: @input1,
                      input2: @input2  } }

           data = @content

           connection = Faraday.new
           result = connection.post do |req|
             req.url 'http://localhost:3001/input'
             req.headers['Content-Type'] = 'application/json'
             req.body = @content.to_json
           end

           if result.success?

             puts "SUCCESS"
             puts "ooooouuuuuttttt: " + @output.to_s
          #   @name = "Sent"
             if !$output.nil? && !$output.blank?
               #end popup
               puts "content value is set to: " + $output.to_s
               #@content = @output
              # @result_showing = true
              parse_json
              @name = "Sent"
            #  respond_to do |format|
              #  format.html
              #  format.js { render action: :show, format: :js }
            #  end
             else
               flash.now[:danger] = 'Model\'s parameter could not be parsed'
             end
           else
             flash.now[:danger] = 'Model computation is not available'
           end
          end

         else if request.get?
           @name = "Model"
           @result_showing = false

           @content = '{ "agro_split" : {
                      "model_name" : "first",
                      "input1" : 25,
                      "input2" : 15 } }'
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

  def show_graph
    @graph = GraphHelper.new("pie", "Testtitle", "Testsubtitle", "pie", false, {
      title: "x-Axis",
      categories: "",
      labels: "",
      type: "percent correct",
      min: "",
      max: ""
      }, {
        title: "y-Axis",
        categories: "",
        labels: "",
        type: "",
        min: "",
        max: ""
        }, {
          layout: "",
          align: "",
          vertical_align: "",
          x: "",
          y: "",
          floating: ""
          },  [ {
            name: 'Agro Split',
            data_array: [
                ['Crops', 40],
                ['Legumes', 60]
            ] }
          ])
  end

=begin
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
            model_view: 'model1',
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

=begin
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

=end

#  helper_method :post_request
end
