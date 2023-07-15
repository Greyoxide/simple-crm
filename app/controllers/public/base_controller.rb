class Public::BaseController < ApplicationController

  layout 'public'
  before_action :set_relative_path

  private

  def set_relative_path
    prepend_view_path 'app/views/public'
  end

end