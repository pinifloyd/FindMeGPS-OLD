module Admin::UsersHelper

  def available_user_role(role, role_ids)
    checked, disabled = true, true if role.name == Role::DEFAULT_ROLE
    checked ||= role_ids.include?(role.id)

    checkbox       = user_role_checkbox(role.id, checked, disabled)
    checkbox_label = label_tag("role_#{role.id}", role.name)
    content        = [ checkbox, checkbox_label ].join.html_safe

    content_tag(:li, content)
  end


  def user_role_checkbox(role_id, checked = false, disabled = false)
    checkbox        = check_box_tag('user[role_ids][]', role_id, checked, id: "role_#{role_id}", disabled: disabled)
    hidden_checkbox = hidden_field_tag('user[role_ids][]', role_id) if checked && disabled

    [ checkbox, hidden_checkbox ].join
  end

end
