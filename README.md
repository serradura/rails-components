Component-Based Rails App
=========================

Related resources:
* https://www.innoq.com/en/blog/rails-frontend-components
* https://goiabada.blog/rails-components-faedd412ce19
* https://www.igvita.com/2007/03/15/block-helpers-and-dry-views-in-rails/
* http://blog.plataformatec.com.br/2011/04/default-views-in-rails-3-0-with-custom-resolvers/

Approaches:
----------

Test the below examples in `app/blogs/index.html.erb`.

**#1 PORO helper components**

```erb
<%= blogs_table_row(blog) %>
```

```erb
<%=
  blogs_table_row blog, -> do
    content_tag(:strong, "Ahoy #{'!' * (index+1)}")
  end
%>
```

**#2 Rails partial components**

```erb
<%= component(:row, blog: blog) %>
```

```erb
<%= component(:row, blog: blog) do %>
  <strong>Ahoy<%= '!' * (index+1) %></strong>
<% end %>
```
