module UserHelper

  def format_role(role)
    t "roles.#{role.name.underscore}"
  end
end