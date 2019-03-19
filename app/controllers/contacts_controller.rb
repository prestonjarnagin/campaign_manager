class ContactsController < ApplicationController

  def index

  end

  def create
    begin
      Contact.create!(contact_params)
      redirect_to contacts_path
    rescue
      flash[:error] = 'Error'
      @contact = Contact.new
      render :new
    end
  end

  def new
    @contact = Contact.new
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :internal_name, :phone_number)
  end

end
