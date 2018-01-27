class ContactsController < ApplicationController
  def index
    @contacts=Contact.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice:' contentsを作成しました！'
    else
      render'new'
    end
  end

  def new
    @contact=Contact.new
  end
  
  private
  def contact_params
    params.require(:contact).permit(:name,:email, :content)
  end
end
