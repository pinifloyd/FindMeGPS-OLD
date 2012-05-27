module ApplicationHelper

  require "#{Rails.root}/lib/boot_strap_form_builder.rb"

  def info_messages(options = {})
    if options[:close_button]
      close_button = link_to 'x', '#', class: 'close', :'data-dismiss' => 'alert'
    end

    content = flash.map do |type, message|
      content_tag :div, class: 'alert alert-' + type.to_s do
        [ close_button, message ].join.html_safe
      end
    end.join if flash

    content_tag :div, content.html_safe, class: 'info-messages-container'
  end

end
