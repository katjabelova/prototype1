class QueryModelFromDatabase
attr_accessor :function_names, :params_with_default_values, :output_values, :settings_widgets

@function_names = []
@params_with_default_values = []
@output_values = []
@settings_widgets = []

  def initialize(model_id)
    @settings_widgets = []
    ModelHasSetting.where(models_id: model_id).find_each do |model_has_settings_widget|
      puts "settings_id: " + model_has_settings_widget.settings_widgets_id.to_s
      SettingsWidget.where(id: model_has_settings_widget.settings_widgets_id).find_each do |settings_widget|
        puts "in settings"
        settings_widget_element = Hash.new
        settings_widget_element['name'] = settings_widget.name
        settings_widget_element['min'] = settings_widget.min
        settings_widget_element['max'] = settings_widget.max
        settings_widget_element['step'] = settings_widget.step
        settings_widget_element['inner_step'] = settings_widget.inner_step
        settings_widget_element['default_value'] = settings_widget.default_value
        settings_widget_element['order_number'] = settings_widget.order_number
        settings_widget_element['value'] = settings_widget.value
        settings_widget_element['title'] = settings_widget.title

        @settings_widgets.push(settings_widget_element)
      end

    end
      puts "settings-element: " + @settings_widgets.to_s

    @params_with_default_values = []
    ModelHasDefaultParam.where(models_id: model_id).find_each do |model_has_default_param|
      ModelDefaultParam.where(id: model_has_default_param.model_default_params_id).find_each do |default_param|
        default_param_element = Hash.new
        default_param_element['param_name'] = default_param.param_name
        default_param_element['default_value'] = default_param.default_value

        @params_with_default_values.push(default_param_element)
      end
    end

    puts "default-element: " + @params_with_default_values.to_s

    @function_names = []
    ModelHasFunction.where(models_id: model_id).find_each do |model_has_function|
      ModelFunction.where(id: model_has_function.model_functions_id).find_each do |model_function|
        function_name_element = Hash.new
        function_name_element['name'] = model_function.name
        function_name_element['path'] = model_function.path
        function_name_element['order_number'] = model_function.order_number

        @function_names.push(function_name_element)
      end
        puts "functions-element: " + @function_names.to_s
    end

    @output_values = []
    ModelHasOutputSet.where(models_id: model_id).order(:model_output_sets_id).each do |model_has_output_set|
      ModelOutputSet.where(id: model_has_output_set.model_output_sets_id).find_each do |model_output_set|
        model_output_set_element = Hash.new
        model_output_set_element['title'] = model_output_set.title
        model_output_set_element['chart_type'] = model_output_set.chart_type
        model_output_set_element['xcategories'] = model_output_set.xcategories
        model_output_set_element['ycategories'] = model_output_set.ycategories
        model_output_set_element['xname'] = model_output_set.xname
        model_output_set_element['yname'] = model_output_set.yname
        model_output_set_element['order_number'] = model_output_set.order_number

        @output_values.push(model_output_set_element)
      end
    end
    puts "output-set-element: " + @output_values.to_s
  end

end
