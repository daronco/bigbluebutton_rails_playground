class LocalesController < ApplicationController
  skip_authorization_check

  def set
    if set_current_locale(params[:id].to_sym)
      set_flash(:success, t("locales.set.success", :locale => params[:id], :lang => params[:id]))
    else
      set_flash(:error, t("locales.set.error", :locale => params[:id], :lang => params[:id]))
    end
    redirect_to default_return_path
  end
end
