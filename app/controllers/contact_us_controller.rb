class ContactUsController < ApplicationController
  def new
    @contact_us = ContactUs.new
  end

  def create
    @contact_us = ContactUs.new(params[:contact_us])
    if @contact_us.valid?
      @contact_us.send_contact
      flash[:success] = 'Obrigado por entrar em contato'
      redirect_to root_path
    else
      render :new
    end
  end
end
