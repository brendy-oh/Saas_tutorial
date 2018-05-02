class Users::RegistrationsController < Devise::RegistrationsController
  # Extend default Devise Gem behaviour so that users signing up with Pro Account (Plan 2),
  # save into the databse with a special Stripe subscription function
  # Otherwise Devise signs up users as normal (Plan 1)
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end