class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.save
    else
      render action: 'new'
    end
  end


  private #все методы ниже будут недоступны извне, только из методов этого контроллера

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end
