class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to contacts_path, notice: "Email Successfully Sent"
    else
      redirect_to contact_path, error: "Email could not be sent"
    end
  end
end
