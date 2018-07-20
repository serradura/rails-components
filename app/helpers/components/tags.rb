module Components
  class Tags
    CONTENT_ELEMENTS = %w[
      a abbr acronym address applet article aside audio b bdi bdo big blockquote
      body button canvas caption center cite code colgroup data datalist dd del
      details dfn dialog dir div dl dt em fieldset figcaption figure font footer
      form frameset h1 h2 h3 h4 h5 h6 head header html i iframe ins kbd keygen
      label legend li main map mark menu menuitem meter nav noframes noscript
      object ol optgroup option output p picture pre progress q rp rt ruby s
      samp script section select small span strike strong style sub summary sup
      svg table tbody td template textarea tfoot th thead time title tr tt u ul
      var video
    ].map(&:freeze).freeze

    VOID_ELEMENTS = %w[
      area base basefont br col embed frame hr img input keygen link meta param
      source track wbr
    ].map(&:freeze).freeze

    ELEMENTS = (CONTENT_ELEMENTS + VOID_ELEMENTS).freeze

    for element in ELEMENTS
      class_eval(<<~RUBY)
        def #{element}(data = nil, options = nil, &block)
          self.call('#{element}', data, options, &block)
        end
      RUBY
    end

    def initialize(view)
      @view = view
    end

    def call(element, data_arg = nil, options_arg = {})
      is_void = VOID_ELEMENTS.include? String(element)
      options = (block_given? || is_void) ? data_arg : options_arg

      return @view.tag(element, options) if is_void

      data = block_given? ? yield(self, @view) : data_arg
      content = data.is_a?(Array) ? @view.safe_join(data) : data
      @view.content_tag(element, content, options)
    end

    def method_missing(custom_element, *args, &block)
      call(custom_element, *args, &block)
    end

    def respond_to?(_anything)
      true
    end
  end
end
