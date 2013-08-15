module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
      base_title = "Portfolio"
      if page_title.empty?
        base_title
      else
        "#{base_title} | #{page_title}"
      end
  end

  # Creates script include tag elements for a javascript file in the :extrahead placeholder
  def include_javascript (file)
    content_for(:extrahead) { javascript_include_tag file }
  end

  # Creates link tag elements for a css file in the :extraheadstyle placeholder
  def include_style (file)
    content_for(:extraheadstyle) { stylesheet_link_tag file }
  end

  # Renders script include tag elements for a javascript in the :extrahead placeholder
  def include_javascript_render (file)
    s = " <script type=\"text/javascript\">" + render(:file => file) + "</script>"
    content_for(:extrahead, raw(s))
  end

end
