class Current < ActiveSupport::CurrentAttributes
  attribute :organization, :user

  resets { Time.zone = nil }

  class MissingCurrentOrganization < StandardError; end

  def organization_or_raise!
    raise Current::MissingCurrentOrganization, 'You must set the organization with Current.organization=' unless organization
    organization
  end

  def user=(user)
    super
    self.organization   = user.organization
    Time.zone           = user.time_zone
  end
end