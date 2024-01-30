class ApplicationController < ActionController::Base
  # CSRF保護の無効化（検証用）
  protect_from_forgery with: :null_session


end

