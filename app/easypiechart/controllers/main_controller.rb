module Easypiechart
  class MainController < Volt::ModelController

    def index_ready
      @watches = []
      @elem = `$(#{first_element}).children().first()`
      if @elem
        if attrs.options
          begin
            JSON.parse(attrs.options).each do |option, value|
              if option == 'size'
                value_in_px = "#{value}px"
                `#{@elem}.css("height",#{value_in_px});`
                `#{@elem}.css("width",#{value_in_px});`
                `#{@elem}.css("line-height",#{value_in_px});`
              end
              `#{@elem}.data(#{option}, #{value})`
            end
          rescue Object => e
            Volt.logger.error "'options' attribute passed to EasyPieChart must be a string that is valid, parsable JSON. Error was #{e}"
          end
        end
        `#{@elem}.easyPieChart();`
        @watches << -> { update_value(attrs.percent) }.watch!
      end
    end

    def update_value
      if @elem
        attrs.percent.then do |percent|
          `#{@elem}.data('easyPieChart').update(#{percent})`
        end
      end
    end

    def before_index_remove
      @watches.each do |watch|
        watch.stop
      end
    end

  end
end
