module ApplicationHelper
  
  def ga_code
    @ga_code = Setting.find_by_name("ga_code").value
  end

  def title
    @setting = Setting.find_by_name("blogtitle")
      @blogtitle = @setting.value
      base_title = @setting.value
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