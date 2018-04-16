require 'json'

class ParseJson
  attr_accessor :type, :title, :subtitle, :chart, :credits, :xAxis, :yAxis, :legend, :series

#  @yAxis = Hash.new
#  @legend = Hash.new
#  @serie = Hash.new

#  xAxis = Struct.new(:title, :categories, :labels, :type, :min, :max)
#  yAxis = Struct.new(:title, :categories, :labels, :type, :min, :max)
#  legend = Struct.new(:layout, :align, :vertical_align, :x, :y, :floating)

#  serie = Struct.new(:name, :data_array)

  def initialize(output)
    if output.nil?
      puts "output is nil"
      return
    end

  #  output = JSON.parse(output)

    puts "pasring started"

    @model_name = output["model_name"]
    @type = output["type"]
    @title = output["title"]
    @subtitle = output["subtitle"]
    @chart = output["chart"]
    @credits = output["credits"]

    puts "generated type: " + @type.to_s + " ; generated model_name: " + @model_name.to_s

    @xAxis = {:title => "", :type => "", :min => "", :max => "", :labels => "", :categories => ""}
    @yAxis = {:title => "", :type => "", :min => "", :max => "", :labels => "", :categories => ""}
    @legend = {:layout => "", :align => "", :vertical_align => "", :x => "", :y => "", :floating => ""}
    @series = []

    axisX = output["xAxis"]
    puts "xAxis value: " + axisX.to_s

    if !axisX.nil?
    @xAxis[:title] = output["xAxis"]["title"]
    @xAxis[:type] = output["xAxis"]["type"]
    @xAxis[:min] = output["xAxis"]["min"]
    @xAxis[:max] = output["xAxis"]["max"]
    @xAxis[:labels] = output["xAxis"]["labels"] #not ready
    @xAxis[:categories] = []

    puts "xAxis output: " + output["xAxis"]["categories"].to_s

    if output["xAxis"]["categories"] != ""
      categoriesX = output["xAxis"]["categories"].to_json
      categoriesX = JSON.parse(categoriesX)

      categoriesX.each_with_index { |(key, value), index|
        @xAxis[:categories][index] = value
      }
    end

    puts "generated type xAxix: " + @xAxis.to_s
    end

    axisY = output["yAxis"]
    if !axisY.nil?
    @yAxis[:title] = output["xAxis"]["title"]
    @yAxis[:type] = output["xAxis"]["type"]
    @yAxis[:min] = output["xAxis"]["min"]
    @yAxis[:max] = output["xAxis"]["max"]
    @yAxis[:labels] = output["xAxis"]["labels"] #not ready
    @yAxis[:categories] = []

    puts "yAxis output: " + output["yAxis"]["categories"].to_s

  if output["yAxis"]["categories"] != ""
    categoriesY = output["yAxis"]["categories"].to_json
    categoriesY = JSON.parse(categoriesY)
    categoriesY.each_with_index { |(key1, value1), index1|
      @yAxis[:categories][index1] = value1
    }
  end

    puts "generated type yAxix: " + @yAxis.to_s
    end

    if output["series"] != ""
    dataArray = []
    puts "series: " + output["series"].to_s
    seriesToJson =  output["series"].to_json
    seriesFromJson = JSON.parse(seriesToJson)
    seriesFromJson.each_with_index { |value, index|
      puts "key_value: " + value[1].to_s
      dataArray[0] = value[1]["name"]
      inner_array = []
      value[1]["data"].each_with_index { |data_value, data_index|
          inner_array[data_index] = data_value
      }
      puts "inner_array: " + inner_array.to_s
     dataArray[1] = inner_array
     series[index] = dataArray
    }
    puts "generated type series: " + series.to_s
  end
  end

  def generate_default_graph()
    graph = {
      chart: { type: "column"},
      title: { text: "Default graph"},
      subtitle: { text: "" },
      legend: { layout: "", align: "", verticalAlign: "", x: "", y: "", floating: ""},
      xAxis: {title: "xAxis", type:"", min: "", max: "", categories: [], labels: []},
      yAxis: {title: "yAxis", type:"", min: "", max: "", categories: [], labels: []},
      series: [{name: "default value", data: [1, 2, 3, 4]}]
    }
    return graph
  end
end
