class FirstQuestionsController < ApplicationController
  def open
    if request.post?
        puts "hashed_input: " + params['hashedinput'].to_s

        if !$session_complete
        #global variables sets
        $session_time = session_time.to_s
        $session_user = session_user.to_s
        $session_file = session_file


        @protocol_input = ""
        @protocol_input += "start \n"
        @protocol_input += "time: " + $session_time + " ;  " + "user: " + $session_user + " \n"
        @protocol_input += "question: " + params['hashedinput'].to_s + " \n"

        puts 'file: ' + session_file.to_s
        puts 'protoxol: ' + @protocol_input

        File.open($session_file, 'a') { |f| f << @protocol_input.to_s }
        else
          @protocol_input = ""
          @protocol_input += "question: " + params['hashedinput'].to_s + " \n"
          @protocol_input += "end" + " \n"

          File.open($session_file, 'a') { |f| f << @protocol_input.to_s }
        end
    else

      if params['finish'] != nil

      else
        puts "session file: " + session_file.to_s
=begin    @timeset = DateTime.now.to_s
      @timeset = @timeset.gsub(':', '-')

      if logged_in?
        @user_id = @current_user.id
      else
        file_count = Dir.glob(File.join(Rails.root + "protocol/protocols/", '**', '*')).select { |file| File.file?(file) }.count + 1
        @user_id = 'default' + file_count.to_s
      end

      puts "time: " + @timeset.to_s
      puts "user: " + @user_id.to_s

      @protocol_input = ""
      @protocol_input += 'start\n'
      @protocol_input += "time: " + @timeset + " ;  " + "user: " + @user_id.to_s + '\n'

      combinedTimeUser = @timeset.to_s + '_' + @user_id.to_s

      @filename = Rails.root + "protocol/protocols/" + combinedTimeUser
      @id = params[:id]
=end
      end
    end
  end
end
