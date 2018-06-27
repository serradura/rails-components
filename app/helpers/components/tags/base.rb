module Components
  module Tags

    class Base < SimpleDelegator
      include Components::Contract

      def initialize(view)
        super @view = view
      end
    end

  end
end
