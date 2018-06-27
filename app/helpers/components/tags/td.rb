module Components
  module Tags

    class Td < Tags::Base
      def call(value, attributes = {})
        content_tag :td, (value.is_a?(Proc) ? value.(view) : value), attributes
      end
    end

  end
end
