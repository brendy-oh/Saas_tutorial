class ContactsController < ApplicationController
  
  # GET REQUEST TO /CONTACT
  # SHOW NEW CONTACT FORM
  def new
    @contact = Contact.new
  end
  
  # POST REQUEST TO /CONTACTS
  def create
    # MASS ASSIGNMENT OF FORM FIELDS INTO CONTACT OBJECT
    @contact = Contact.new(contact_params)
    # SAVE THE CONTACT OBJECT TO THE DATABASE
    if @contact.save
      # STORE FORM FIELDS INTO VIA PARAMETERS, INTO VARIABLES
       name = params[:contact][:name]
       email = params[:contact][:email]
       body = params[:contact][:comments]
       #PLUG VARIABLES INTO THE CONTACT MAILER EMAIL METHOD
       #SEND EMAIL
       ContactMailer.contact_email(name, email, body).deliver
       #STORE SUCCESS MESSAGE IN FLASH HASH
       #REDIRECT TO THE NEW ACTION
       flash[:success] = "Meassage Sent."
       redirect_to new_contact_path
    else
      #IF CONTACT OBEJECT DOESN'T SAVE
      #STORE ERRORS IN FLASH HASH
      #AND REDIRECT TO THE NEW ACTION
       flash[:danger] = @contact.errors.full_messages.join(", ")
       redirect_to new_contact_path 
    end
  end
  
  #TO COLLECT DATA FROM FORM, YOU NEED TO USE STRONG PARAMETERS
  #AND WHITE LIST FORM FIELDS
  private
    def contact_params
       params.require(:contact).permit(:name, :email, :comments)
    end
end