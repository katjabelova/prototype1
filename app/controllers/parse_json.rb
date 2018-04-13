class ParseJson
  attr_accessor :type, :title, :subtitle, :chart, :credits, :x_opts, :y_opts, :legend_opts, :series

  xAxis = Struct.new(:title, :categories, :labels, :type, :min, :max)
  yAxis = Struct.new(:title, :categories, :labels, :type, :min, :max)
  legend = Struct.new(:layout, :align, :vertical_align, :x, :y, :floating)
  series = Struct.new(:name, :data_array)

  def initialize(output)
    # @default_graph = generate_default_graph()
    puts "pasring started"
    @model_name = output[:model_name]
    @type = output[:type]
    @title = output[:title]
    @subtitle = output[:subtitle]
    @chart = output[:chart]
    @credits = output[:credits]
    puts "generated type: " + @type.to_s + " ; generated model_name: " + @model_name.to_s
=begin
    @x_opts = XAxis.new(x_opts[:title], x_opts[:categories], x_opts[:labels], x_opts[:type], x_opts[:min], x_opts[:max])
    @y_opts = YAxis.new(y_opts[:title], y_opts[:categories], y_opts[:labels], y_opts[:type], y_opts[:min], y_opts[:max])
    @legend_opts = Legend.new(legend_opts[:layout], legend_opts[:align], legend_opts[:vertical_align], legend_opts[:x], legend_opts[:y], legend_opts[:floating])

    @series = []
    series.each_with_index { |value, index|
      @series[index] = Series.new(value[:name], value[:data_array])
    }
=end
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
