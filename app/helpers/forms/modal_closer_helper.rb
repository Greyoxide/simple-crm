module Forms::ModalCloserHelper
  def modal_closer
    content_tag :span, 'Cancel', class: 'closer', data: { action: 'click->modal#close' }
  end
end
