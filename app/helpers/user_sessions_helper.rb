module UserSessionsHelper

  def form_notice(type)
    css_class = ['css-' + type.to_s]

    notice = if flash[type]
      [ separator(css_class),
        content_tag(:p, flash[type], class: css_class),
        separator(css_class)
      ].join
    else
      separator
    end

    notice.html_safe
  end

end
