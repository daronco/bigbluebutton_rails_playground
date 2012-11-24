module IconsHelper

  # Default icon that shows a tooltip with help about something
  def icon_help(title, options={})
    cls = "icon-help tooltipped upwards "
    options[:class] = options.has_key?(:class) ? cls + options[:class] : cls
    options.merge!(:title => title)
    content_tag :div, nil, options
  end

  # Default icon that shows a tooltip with information about something
  def icon_info(title, options={})
    cls = "icon-info tooltipped upwards "
    options[:class] = options.has_key?(:class) ? cls + options[:class] : cls
    options.merge!(:title => title)
    content_tag :div, nil, options
  end

end
