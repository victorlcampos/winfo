module ArticlesHelper
  def markdown(text, wrap = true)

    html_extensions = {
      hard_wrap: wrap,
      filter_html: true
    }

    markdown_extensions = {
      autolink: true,
      no_intraemphasis: true,
      fenced_code: true,
      gh_blockcode: true
    }

    renderer = Redcarpet::Render::HTML.new(html_extensions)
    markdown = Redcarpet::Markdown.new(renderer, markdown_extensions)

    markdown.render(text).html_safe
  end
end
