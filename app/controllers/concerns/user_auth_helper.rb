module UserAuthHelper
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    authenticated_user = User.unscoped.find_by_key_card(cookies.encrypted[:id])
    if authenticated_user&.active?
      Current.user = authenticated_user
    else
      redirect_to [:new, :public, :session]
    end
  end
end