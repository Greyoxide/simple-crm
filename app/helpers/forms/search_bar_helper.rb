module Forms::SearchBarHelper

  # def search_bar(url, turbo_target, attribute, placeholder)
  #   content_tag :section do
  #     turbo_frame_tag :search_bar do
  #       search_form_for @q, url: url, id: 'search', data: { turbo_frame: turbo_target, controller: 'search', search_target: 'form' } do |f|
  #         concat tabler_icon :search, classes: ['search-icon'], color: '#A3ADB1'
  #         concat f.search_field attribute, placeholder: placeholder, data: { action: 'input->search#submit' }
  #       end
  #     end
  #   end
  # end
  

  def search_bar(url, turbo_target, attribute, placeholder, options={})
    content_tag :section do
      turbo_frame_tag :search_bar do
        form_with model: @q, url: url, method: :get, id: 'search', data: { turbo_frame: turbo_target, controller: 'search', search_target: 'form' } do |f|
          concat search_link(options)
          concat f.search_field attribute, placeholder: placeholder, data: { action: 'input->search#submit' }
        end
      end
    end
  end
  
  def search_link(options)
    icon = tabler_icon :search, classes: ['search-icon']
    
    unless options[:advanced_search_container].blank?
      content_tag :div, icon, data: { controller: 'toggle', action: 'click->toggle#switch' }
    else
      icon
    end
  end

end