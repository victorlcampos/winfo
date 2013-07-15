module ArticlesHelper
  def markdown(text)
    extensions = {
      hard_wrap: true,
      filter_html: true,
      autolink: true,
      no_intraemphasis: true,
      fenced_code: true,
      gh_blockcode: true
    }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)
    markdown.render(text).html_safe
  end
end
