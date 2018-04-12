class ParseJson
  attr_accessor :default_graph

  def initialize()
     @default_graph = generate_default_graph()
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
