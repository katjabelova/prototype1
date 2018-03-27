class GraphHelper
  attr_accessor :type, :title, :subtitle, :chart, :credits, :x_opts, :y_opts, :legend_opts, :series

  XAxis = Struct.new(:title, :categories, :labels, :type, :min, :max)
  YAxis = Struct.new(:title, :categories, :labels, :type, :min, :max)
  Legend = Struct.new(:layout, :align, :vertical_align, :x, :y, :floating)
  Series = Struct.new(:name, :data_array)
  # TODO: may be used later
  #PlotOptions = Struct.new()
  #Responsive = Struct.new()
  #Tooltip = Struct.new()

  def initialize(type, title, subtitle, chart, credits, x_opts, y_opts, legend_opts, series)
    @type = type
    @title = title
    @subtitle = subtitle
    @chart = chart
    @credits = credits
    @x_opts = XAxis.new(x_opts[:title], x_opts[:categories], x_opts[:labels], x_opts[:type], x_opts[:min], x_opts[:max])
    @y_opts = YAxis.new(y_opts[:title], y_opts[:categories], y_opts[:labels], y_opts[:type], y_opts[:min], y_opts[:max])
    @legend_opts = Legend.new(legend_opts[:layout], legend_opts[:align], legend_opts[:vertical_align], legend_opts[:x], legend_opts[:y], legend_opts[:floating])

    @series = []
    series.each_with_index { |value, index|
      @series[index] = Series.new(value[:name], value[:data_array])
    }

    puts "begin structure"
    puts @type
    puts @title
    puts @subtitle
    puts @chart
    puts @credits
    puts @x_opts
    puts @y_opts
    puts @legend_opts
    puts @series
    puts "end structure"

  # TODO: may be used later
  #  @plot_opts = PlotOptions.new()
  #  @response_opts = Responsive.new()
  #  @tool_opts = Tooltip.new()
  end

end
