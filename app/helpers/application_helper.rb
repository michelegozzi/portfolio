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

  # Renders script include tag elements for a javascript in the :extrahead placeholder
  def include_dropbox_api ()
    s = " <script type=\"text/javascript\" src=\"https://www.dropbox.com/static/api/2/dropins.js\" id=\"dropboxjs\" data-app-key=\"zpabeg0ylo7r0vd\"></script>"
    content_for(:extrahead, raw(s))


#<script type="text/javascript" src="https://www.dropbox.com/static/api/2/dropins.js" id="dropboxjs" data-app-key="zpabeg0ylo7r0vd"></script>

  end

  # Creates a link tag that renders the form fields elements for the nested Resource model
  # Example:
  #   <%= link_to_add_resource_fields '<i class="icon-plus icon-white"></i>'.html_safe, f, :activities, category_id %>
  def link_to_add_resource_fields(inner_text, f, association = :resources)
    new_object = f.object.class.reflect_on_association(association).klass.new
    link_to_add_fields(inner_text, f, association, new_object)
  end

  # Creates a link tag that renders the form fields elements for the nested Skill model
  # Example:
  #   <%= link_to_add_skill_fields '<i class="icon-plus icon-white"></i>'.html_safe, f, :activities, category_id %>
  def link_to_add_skill_fields(inner_text, f, association = :skills)
    new_object = f.object.class.reflect_on_association(association).klass.new
    link_to_add_fields(inner_text, f, association, new_object)
  end

  # Creates a link tag that renders the form fields elements for nested models
  def link_to_add_fields(inner_text, f, association, new_object)
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(inner_text, "add_#{association.to_s.singularize}_fields(this, '#{association}', '#{escape_javascript(fields)}')")
  end

  # Creates a link tag that removes the form field elements
  def link_to_remove_fields(inner_text, f, association)
    f.hidden_field(:_destroy) + link_to_function(inner_text, "remove_#{association.to_s.singularize}_fields(this)")
  end

  # Creates a link tag that handle the sorting criteria (column name and direction).
  def sortable(column, title = nil, icon_asc = "icon-arrow-up", icon_desc = "icon-arrow-down", icon_default = "icon-list")
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    i_css_class = column == sort_column ? sort_direction == "asc" ? icon_asc : icon_desc : icon_default
    
    link_to "#{title} #{content_tag :i, nil, class: i_css_class}".html_safe, {:sort => column, :direction => direction, :q => params[:q].nil? ? '' : params[:q]}, {:class => css_class}
  end

  def bs3glyphincon(name)
    tag("span", class: "glyphicon glyphicon-#{name}").html_safe
    #html.html_safe
  end

  def render_resource(encoded_resource, mime_type)
    send_data Base64.decode64(encoded_resource), :type => mime_type, :disposition => 'inline' 
  end

end
