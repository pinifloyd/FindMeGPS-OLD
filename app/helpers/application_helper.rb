module ApplicationHelper

  def required_field
    content_tag(:span, ' (required)', class: 'required-field')
  end

end
