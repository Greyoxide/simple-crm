module Forms::SelectFieldHelper

  def select_field(model, attribute, list, **options)
    content_tag :div, class: 'select'  do
      concat model.select attribute, list, {}, options
      # concat tabler_icon :chevron_down
    end
  end
  
  def select_field_block(**options, &block)
    content_tag :div, class: 'select' do
      concat capture(&block)
      concat tabler_icon :chevron_down
    end
  end

end
