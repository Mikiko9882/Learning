class Teacher::BaseController < ApplicationController
  def after_sign_in_path_for(resource)
    teacher_root_path
  end
end