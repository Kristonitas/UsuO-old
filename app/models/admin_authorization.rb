class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    case subject
    when AdminUser
      user.is_super?
    else
      true
    end
  end

end