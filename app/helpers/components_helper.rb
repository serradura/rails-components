module ComponentsHelper
  def component(name, locals=nil, &block)
    render_component(
      component_path(controller_path, name),
      locals,
      &block
    )
  end

  def render_component(name, locals={}, &block)
    if block_given?
      # using `layout` is a trick to allow passing blocks to partials
      # (cf. http://stackoverflow.com/a/2952056)
      render layout: name, locals: locals, &block
    else
      render partial: name, locals: locals
    end
  end

  private

  def component_path(namespace, name)
    "#{namespace}/components/#{name}/#{name}"
  end
end
