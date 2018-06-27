module Components
  module Contract
    extend ActiveSupport::Concern

    included do
      attr_reader :view
    end

    def call
      raise NotImplementedError
    end
  end

  class Base
    include Contract

    def initialize(view)
      @view = view
    end
  end
end
