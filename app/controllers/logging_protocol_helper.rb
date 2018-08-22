class LoggingProtocolHelper

  def write(parametername, value)
    putValue =  parametername.to_s + ': ' + value.to_s
    puts putValue
    File.open(File.join("log", 'protocol_log'), 'a') do |f|
      f.puts putValue
    end
  end

  def initialize(classname, methodname, modelname, model_id, user_id)
    write('class', classname)
    write('method', methodname)
    write('modelname', modelname)
    write('model_id', model_id)
    write('user_id', user_id)
  end

end
