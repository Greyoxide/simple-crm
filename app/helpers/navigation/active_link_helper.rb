module Navigation::ActiveLinkHelper
  def active_link_to(path, options = {}, &block)
    options[:class] ||= ''
    options[:class] += ' selected' if current_page?(path)

    link_to(path, options, &block)
  end
end