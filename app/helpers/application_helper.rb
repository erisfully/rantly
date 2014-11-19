module ApplicationHelper
  def markdown(text)
   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
    markdown.render(text).html_safe
  end

  def search_hashtag(text)
    new_text = text.split(' ').map do |word|
      if word[0] == '#'
        "<a href='/search?utf8=✓&search=#{word}&commit=SEARCH'>#{word}</a>"
      else
        word
      end
    end
  new_text.join(' ').html_safe
  end
end
