module Admin::UsersHelper

  def available_user_roles(roles, current_role_ids)
    roles.map do |role|
      checked, disabled = true, true if role.name == Role::DEFAULT_ROLE
      checked ||= current_role_ids.include?(role.id)

      user_role_checkbox(role, checked, disabled)
    end.join.html_safe
  end

  def user_role_checkbox(role, checked = false, disabled = false)
    checkbox_name = 'user[role_ids][]'
    checkbox_id   = 'role_' + role.id.to_s

    checkbox = check_box_tag(checkbox_name, role.id, checked, id: checkbox_id, disabled: disabled)
    if checked && disabled
      hidden_checkbox = hidden_field_tag(checkbox_name, role.id)
    end

    content = [ checkbox, role.name, hidden_checkbox ].join

    content_tag(:label, content.html_safe, class: 'checkbox')
  end

end
