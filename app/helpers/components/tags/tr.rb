module Components
  module Tags

    class Tr < Tags::Base
      def call(cells, attributes={})
        content_tag :tr, safe_join(Array(cells)), attributes
      end
    end

  end
end
