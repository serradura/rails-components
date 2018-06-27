module Components::Blogs::TableRowHelper

  class Component < Components::Base
    delegate :td, :tr, to: :tags

    def call(blog, custom_content)
      tr.(
        cells(blog, custom_content)
      )
    end

    private

    def cells(blog, custom_content)
      [
        td.(blog.title),
        td.(blog.body),
        td.(-> h { h.link_to 'Show', blog }),
        td.(-> h { h.link_to 'Edit', h.edit_blog_path(blog) }),
        td.(-> h do
          h.link_to 'Destroy', blog, method: :delete,
                                     data: { confirm: 'Are you sure?' }
        end),
        unless custom_content.nil?
          td.(custom_content, {
            data: { 'row-alert-text': true }, class: 'row-el--blue'
          })
        end
      ].tap(&:compact!)
    end

    def tags
      @tags ||= Components::Tags::Helpers.new(view)
    end
  end

  def blogs_table_row(blog, custom_content = nil)
    Component.new(self).(blog, custom_content)
  end

end
