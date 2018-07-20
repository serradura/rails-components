Component-Based Rails App
=========================

Test the below examples in `app/blogs/index.html.erb`.

**#1 PORO helper components**

```erb
<tbody>
  <%= safe_join @blogs.map(&method(:blogs_table_row)) %>
</tbody>
```

```erb
<tbody>
  <% @blogs.each do |blog| %>
    <%= blogs_table_row(blog) %>
  <% end %>
</tbody>
```

```erb
<tbody>
  <% @blogs.each_with_index do |blog, index| %>
    <%=
      blogs_table_row blog, -> do
        content_tag(:strong, "Ahoy #{'!' * (index+1)}")
      end
    %>
  <% end %>
</tbody>
```

**#2 Rails partial components**

```erb
<tbody>
  <% @blogs.each do |blog| %>
    <%= component(:row, blog: blog) %>
  <% end %>
</tbody>
```

```erb
<tbody>
  <% @blogs.each_with_index do |blog, index| %>
    <%= component(:row, blog: blog) do %>
      <strong>Ahoy<%= '!' * (index+1) %></strong>
    <% end %>
  <% end %>
</tbody>
```

Extras:
-------

Test the following snippets in `rails console`:

```ruby
tags = Components::Tags.new(helper)

tags.br
#=> "<br />"

tags.br style: 'margin-top: 10px'
#=> "<br style=\"margin-top: 10px\" />"

tags.ul
#=> "<ul></ul>"

tags.ul [1,2,3].map &tags.method(:li)
#=> "<ul><li>1</li><li>2</li><li>3</li></ul>"
```

Related resources:
------------------
* https://www.innoq.com/en/blog/rails-frontend-components
* https://goiabada.blog/rails-components-faedd412ce19
* https://www.igvita.com/2007/03/15/block-helpers-and-dry-views-in-rails/
* http://blog.plataformatec.com.br/2011/04/default-views-in-rails-3-0-with-custom-resolvers/
