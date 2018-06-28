module Components::Blogs::TableRowHelper

  class Component < Components::Base
    delegate :td, :tr, to: :tags
    delegate :link_to, :edit_blog_path, to: :view

    def call(blog, custom_content)
      tr cells(blog, custom_content)
    end

    private

    def cells(blog, custom_content)
      [
        td(blog.title),
        td(blog.body),
        td(link_to 'Show', blog),
        td(link_to 'Edit', edit_blog_path(blog)),
        td(link_to 'Destroy', blog, method: :delete,
                                    data: { confirm: 'Are you sure?' }),
        td_with(custom_content: custom_content)
      ]
    end

    def td_with(custom_content:)
      return if custom_content.nil?

      content = custom_content.is_a?(Proc) ? custom_content.() : custom_content

      td content, class: 'row-el--blue', data: { 'row-alert-text': true }
    end
  end

  def blogs_table_row(blog, custom_content = nil)
    Component.new(self).(blog, custom_content)
  end

end
