Component-Based Rails App
=========================

Related resources:
* https://www.innoq.com/en/blog/rails-frontend-components
* https://goiabada.blog/rails-components-faedd412ce19
* https://www.igvita.com/2007/03/15/block-helpers-and-dry-views-in-rails/
* http://blog.plataformatec.com.br/2011/04/default-views-in-rails-3-0-with-custom-resolvers/

Approaches:
----------

Apply the examples below in `app/blogs/index.html.erb`.

**#1 Components based on Rails partials**

```erb
<%= component(:row, blog: blog) %>
```

```erb
<%= component(:row, blog: blog) do %>
  <strong>Ahoy<%= '!' * (index+1) %></strong>
<% end %>
```
**#2 PORO components**

```erb
<%= blogs_table_row(blog) %>
```

```erb
<%=
  blogs_table_row(blog, -> h do
    h.content_tag(:strong) { "Ahoy #{'!' * (index+1)}" }
  end)
%>
```


