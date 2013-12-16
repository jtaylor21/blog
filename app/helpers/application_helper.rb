module ApplicationHelper

  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, filter_html: true)
  end

end
