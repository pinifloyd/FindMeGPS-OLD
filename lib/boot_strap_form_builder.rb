class BootStrapFormBuilder < ActionView::Helpers::FormBuilder

  delegate :content_tag, :label_tag, :concat, to: :@template

  CSS = {
    group_container: 'control-group',
    input_container: 'controls',
    error_container: 'help-block',
    error_block:     'error',
    label:           'control-label',
    label_checkbox:  'checkbox'
  }

  FORM_FIELDS = %w(text_field email_field password_field password_confirmation)

  FORM_FIELDS.each do |form_method|
    define_method(form_method) do |object_method, *args|
      content_tag(:div, class: container_class(:group_container, object_method, *args)) {
        concat label_tag(object_method, nil, class: CSS[:label])

        concat \
          content_tag(:div, class: container_class(:input_container, object_method, *args)) {
            concat super object_method, *args
            error_message_container(object_method, *args)
          }
      }
    end
  end

  def check_box(object_method, *args)
    content_tag(:div, class: container_class(:group_container, object_method)) {
      concat \
        content_tag(:div, class: container_class(:input_container, object_method)) {
          label_tag(object_method, nil, class: CSS[:label_checkbox]) {
            concat super object_method, *args
            options = args.extract_options!
            concat options[:label]
          }
        }
    }
  end


  def error_message_container(method, options= {})
    return if options[:error] == false || options[:error_message] == false

    error_message = @object.errors[method].try(:first)

    return unless error_message

    concat content_tag(:p, error_message, class: CSS[:error_container])
  end

  def container_class(type, method, options = {})
    unless options[:error] == false || @object.errors[method].blank?
      error_block = CSS[:error_block]
    end

    [ CSS[type], error_block ].join(' ')
  end

end
