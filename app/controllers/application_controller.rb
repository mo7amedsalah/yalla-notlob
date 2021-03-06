class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning
#     devise :database_authenticatable, :registerable,
#     :confirmable, :recoverable, :validatable
# validates_uniqueness_of :email
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :image,:image_cache])
  end

  def getAllNotification
    
  end
  before_action :getAllNotification
  def getAllNotification
    if current_user
      @notifications = Notification.where(user_id: current_user.id).order(created_at: :desc)    
    end
  end

  before_action :authenticate_user!
#   def serializable_hash(options = nil) 
#     super(options).merge(encrypted_password: encrypted_password) 
#   end
end
