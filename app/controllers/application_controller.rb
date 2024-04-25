class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    elsif resource.is_a?(Teacher)
      teacher_root_path
    else
      super
    end
  end
end
