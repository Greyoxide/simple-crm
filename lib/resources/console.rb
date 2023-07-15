module Org
  module Console
    def t(id)
      Current.organization = Organization.find(id)
      puts "Current organization switched to #{Current.organization.name} (#{Current.organization.id})"
    end
  end
end