module CharismaHelper
  def ctext_field(f, label_name)
    content_tag :div, class: 'control-group' do
      raw(
        f.label(label_name, class: 'control-label') +
        content_tag(:div, class: 'controls') do
          raw(
            f.text_field label_name, class: 'input-xlarge focused'
          )
        end
      )
    end
  end

  def ctext_area(f, label_name)
    content_tag :div, class: 'control-group' do
      raw(
        f.label(label_name, class: 'control-label') +
        content_tag(:div, class: 'controls') do
          raw(
            f.text_area label_name
          )
        end
      )
    end
  end

  def cform_actions(f, opts = {})
    use_submit  = opts[:use_submit].nil?  ? true  : opts[:use_submit]
    use_cancel  = opts[:use_cancel].nil?  ? true : opts[:use_cancel]
    submit_text = opts[:submit_text].nil? ? 'Enviar' : opts[:submit_text]
    cancel_text = opts[:cancel_text].nil? ? 'Voltar' : opts[:cancel_text]

    default_cancel_function = 'javascript:window.history.back();void(0);'
    cancel_function = opts[:cancel_function]
    cancel_function = default_cancel_function if cancel_function.nil?

    content_tag :div, class: 'form-actions' do
      raw(
        (use_submit ? f.submit(submit_text, class: 'btn btn-primary') : '') +
        (use_cancel ? link_to(cancel_text, cancel_function, class: 'btn') : '')
      )
    end
  end

  def cbox(size, title, &content)
    content_tag :div, class: "box span#{size}" do
      raw(
        content_tag(:div, class: 'box-header well') do
          raw(
            content_tag(:h2) do
              raw(
                '<i class="icon-th"></i>' +
                title
              )
            end
          )
        end +
        content_tag(:div, class: 'box-content') do
          raw(
            content_tag(:div, class: 'row-fluid') do
              capture(&content)
            end
          )
        end
      )
    end
  end

  def calert_error(field, msg)
    content_tag :div, class: "alert alert-error" do
      raw(
        '<button type="button" class="close" data-dismiss="alert">×</button>' +
        "<strong>#{field}</strong> #{msg}"
      )
    end
  end
end