module ApplicationHelper
  def markdown(text)
   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
    markdown.render(text).html_safe
  end
end
