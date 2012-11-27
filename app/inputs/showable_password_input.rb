class ShowablePasswordInput < SimpleForm::Inputs::PasswordInput
  include ActionView::Helpers::FormTagHelper
  include ActionView::Context

  def input
    input_html_options[:class] = ['password', input_html_options[:class]].compact

    # the input
    field = @builder.password_field(attribute_name, input_html_options)

    controls = content_tag :div, :class => "showable_password_controls" do

      # checkbox
      cb_name = "#{attribute_name.to_s}_checkbox_show"
      cb = check_box_tag cb_name, 'show', false, :class => 'showable_password_checkbox'

      # label
      cb_label_name = "#{cb_name}_label"
      cb_label = content_tag :label, I18n.t('simple_form.show_question'),
        :class => 'showable_password_checkbox_label',
        :name => cb_label_name,
        :for => cb_name

      "#{cb}#{cb_label}".html_safe
    end

    "#{field}#{controls}".html_safe
  end
end
