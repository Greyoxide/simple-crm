module OrganizationOwnable
  extend ActiveSupport::Concern

  included do
    belongs_to :organization, optional: true
    # Organization is actually not optional, but we not do want
    # to generate a SELECT query to verify the account is
    # there every time. We get this protection for free
    # because of the `Current.organization_or_raise!`
    # and also through FK constraints.
    default_scope { where(organization: Current.organization_or_raise!)}
  end
end