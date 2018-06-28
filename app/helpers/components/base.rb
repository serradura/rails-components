module Components
  class Base
    def initialize(view)
      @view = view
    end

    def call
      raise NotImplementedError
    end

    private

    def view; @view; end

    def tags
      @tags ||= Components::Tags.new(view)
    end
  end
end
