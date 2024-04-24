class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    else
      # デフォルトのリダイレクト先を設定する場合、適切なパスを指定します。
      super
    end
  end
end
