module ApplicationHelper

  require "#{Rails.root}/lib/boot_strap_form_builder.rb"

  def info_messages(type, options = {})
    return unless flash[type]

    if options[:close_button]
      close_button = link_to('x', '#', class: 'close', :'data-dismiss' => 'alert')
    end

    info_content = [ close_button, flash[type] ].join

    content_tag(:div, info_content.html_safe, class: 'alert alert-' + type.to_s)
  end

end
