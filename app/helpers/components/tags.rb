module Components
  class Tags
    NAMES = %i[
      a abbr acronym address applet area article aside audio b base basefont
      bdi bdo big blockquote body br button canvas caption center cite code
      col colgroup data datalist dd del details dfn dialog dir div dl dt em
      embed fieldset figcaption figure font footer form frame frameset h1 h2
      h3 h4 h5 h6 head header hr html i iframe img input ins kbd label legend
      li link main map mark menu menuitem meta meter nav noframes noscript
      object ol optgroup option output p param picture pre progress q rp rt
      ruby s samp script section select small source span strike strong style
      sub summary sup svg table tbody td template textarea tfoot th thead time
      title tr track tt u ul var video wbr
    ].freeze

    for name in NAMES
      class_eval(<<~TAG_NAME)
        def #{name}(data = nil, options = nil, &block)
          self.call(:#{name}, data, options, &block)
        end
      TAG_NAME
    end

    def initialize(view)
      @view = view
    end

    def call(tag_name, data_arg = nil, options_arg = {})
      data = block_given? ? yield(self, @view) : data_arg
      options = block_given? ? data_arg : options_arg
      content = data.is_a?(Array) ? @view.safe_join(data) : data

      @view.content_tag(tag_name, content, options)
    end

    def method_missing(custom_tag_name, *args, &block)
      call(custom_tag_name, *args, &block)
    end

    def respond_to?(_anything)
      true
    end
  end
end
