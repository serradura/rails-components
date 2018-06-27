module Components
  module Tags

    class Helpers
      def initialize(view)
        @view = view
      end

      def td
        @td ||= Tags::Td.new(@view)
      end

      def tr
        @tr ||= Tags::Tr.new(@view)
      end
    end

  end
end
