module ApplicationHelper

  def required_field
    content_tag(:span, ' (required)', class: 'css-required-field')
  end

  def separator(classes = [])
    classes |= ['css-separator']
    classes = classes.join(' ')

    content_tag(:div, nil, class: classes)
  end
end
