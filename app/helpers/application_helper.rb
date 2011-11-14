module ApplicationHelper

  def title

      base_title = "Vincent Cabansag"
      if @title.nil?
        base_title
      else
        "#{base_title} | #{@title}"
      end
    end

  def markdown(text)

    options = [ :hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *options).to_html.html_safe

  end


end
