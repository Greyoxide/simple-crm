module Forms::ErrorsHelper
  def errors(object)
    if object.errors.any?
      content_tag :ul, class: 'errors' do
        object.errors.full_messages.collect do |error|
          concat content_tag :li, error, class: 'error'
        end
      end
    end
  end
end
