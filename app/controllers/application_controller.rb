class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  #before_action :authenticate_admin!, if: :admin_url #pathに/adminが含まれている全てのページは、adminでログインしないと見れない

  #request.fullpathで、飛んだ先のpathを全て取得します。
  #include?("/admin")で、valと同じ要素が含まれていれば、trueを返します。
  def admin_url
    request.fullpath.include?("/admin")
  end

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      customers_current_customer_path # ログイン後に遷移するpathを設定
    elsif admin_signed_in?
      admin_orders_path
    end
  end

  def after_sign_out_path_for(resource) # ログアウト後に遷移するpathを設定
    if resource == :customer
      root_path
    elsif resource == :admin
      new_admin_session_path
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    end
end
