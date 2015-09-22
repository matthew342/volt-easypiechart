module Easypiechart
  class MainController < Volt::ModelController

    def index_ready
      @watches = []
      @elem = `$("#" + #{first_element}.id)`
      if @elem
        if attrs.options
          begin
            JSON.parse(attrs.options).each do |option, value|
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
        `#{@elem}.data('easyPieChart').update(#{attrs.percent})`
      end
    end

    def before_index_remove
      @watches.each do |watch|
        watch.stop
      end
    end

  end
end
