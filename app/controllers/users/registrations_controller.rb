class Users::RegistrationController < Devise::RegistrationsController
  def create
      super # Call original method
  end
end
