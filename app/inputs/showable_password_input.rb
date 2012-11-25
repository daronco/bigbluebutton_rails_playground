class ShowablePasswordInput < SimpleForm::Inputs::PasswordInput
  include ActionView::Helpers::FormTagHelper

  def input
    field = @builder.password_field(attribute_name, input_html_options)
    cb_name = attribute_name.to_s + '_show'
    cb = check_box_tag cb_name, 'show', false, :class => 'showable_password_show'
    cb_label = content_tag :span, I18n.t('simple_form.show_question'), :class => 'showable_password_show_label', :name => cb_name
    "#{field}#{cb}#{cb_label}".html_safe
  end
end
