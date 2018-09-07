class QueryModelFromDatabase
attr_accessor :function_names, :params_with_default_values, :output_values, :settings_widgets, :sub_slider_settings, :nested_slider_settings,
:subpifsCount

@function_names = []
@params_with_default_values = []
@output_values = []
@settings_widgets = []
@sub_slider_settings = Hash.new
@nested_slider_settings = []
@subpifsCount = 0

  def initialize(model_id)
    @settings_widgets = []
    @sub_slider_settings = Hash.new
    @subpifsCount = 0

    ModelHasSetting.where(models_id: model_id).find_each do |model_has_settings_widget|
      puts "settings_id: " + model_has_settings_widget.settings_widgets_id.to_s
      SettingsWidget.where(id: model_has_settings_widget.settings_widgets_id).find_each do |settings_widget|
          puts "in settings"
          puts "settings_widget: " + settings_widget.id.to_s
          settings_widget_element = Hash.new
          settings_widget_element['id'] = settings_widget.id
          settings_widget_element['name'] = settings_widget.name
          settings_widget_element['min'] = settings_widget.min
          settings_widget_element['max'] = settings_widget.max
          settings_widget_element['step'] = settings_widget.step
          settings_widget_element['inner_step'] = settings_widget.inner_step
          #settings_widget_element['default_value'] = settings_widget.default_value
          settings_widget_element['order_number'] = settings_widget.order_number
          settings_widget_element['value'] = settings_widget.value
          settings_widget_element['title'] = settings_widget.title

          default_param = ModelDefaultParam.find(settings_widget.model_default_params_id)
          settings_widget_element['default_value'] = default_param.default_value
          settings_widget_element['param_name'] = default_param.param_name

       if settings_widget.parent.nil?
         puts "parent nil"
          @settings_widgets.push(settings_widget_element)
       else
          puts "parent not nil"
          parentId = settings_widget.parent.to_s
          puts "parent_id: " + parentId

          if @sub_slider_settings[parentId] == nil
              @sub_slider_settings[parentId] = []
          end
        #  @sub_slider_settings[parentId] = @sub_slider_settings[parentId] == nil ? [] : @sub_slider_settings[parentId]

          @subpifsCount = @subpifsCount + 1
          @sub_slider_settings[parentId].push(settings_widget_element)

          puts "sub_slider in query model: " + @sub_slider_settings.to_s
       end

      end
    end

      @nested_slider_settings = @settings_widgets

      puts "before " + @sub_slider_settings.to_s

      index = 0
      while index < (@settings_widgets.length + subpifsCount - 1)
  #    for index in 0..@nested_slider_settings.length do
  #    @nested_slider_settings.each_with_index do |setting, index|
        puts "index: " + index.to_s
        setting = @nested_slider_settings[index]
        puts "setting id: " + setting['id'].to_s
        if @sub_slider_settings.key?(setting['id'].to_s)
          puts "setting id: " + setting['id'].to_s
          first_part_array = @nested_slider_settings[0..index]
          puts "first part array: " + first_part_array.to_s
          second_part_array = @nested_slider_settings[index + 1..@nested_slider_settings.length - 1]
          puts "second part array: " + second_part_array.to_s
          count = 0
          @sub_slider_settings[setting['id'].to_s].each_with_index do |subslider, index|
            first_part_array.push(subslider)
            count += 1
          end
          @nested_slider_settings = first_part_array + second_part_array
          puts "nested slider step: " + @nested_slider_settings.to_s
          index = index + count + 1
        else
          index += 1
        end
      end

      puts "nested settings: " + @nested_slider_settings.to_s
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
