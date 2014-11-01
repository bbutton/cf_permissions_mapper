class AuthenticatedUser
  attr_reader :user_name
  attr_reader :email
  attr_reader :given_name
  attr_reader :family_name

  def initialize user_name, email, given_name, family_name
    @user_name = user_name
    @email = email
    @given_name = given_name
    @family_name = family_name
  end
end