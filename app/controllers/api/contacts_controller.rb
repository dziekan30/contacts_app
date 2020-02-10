class Api::ContactsController < ApplicationController

  def index
    if current_user
      group_name = params[:group]

      if 
        group_name
        group = Group.find_by(name: group_name)
        @contacts = group.contacts.where(user_id: current_user.id)
      else
        @contacts = current_user.contacts
      end

      render 'index.json.jb'
    else
      render json: {}
    end
  end

  def create
    @contact = Contact.new(
                         first_name: params[:first_name],
                         middle_name: params[:middle_name],
                         last_name: params[:last_name],
                         email: params[:email],
                         phone_number: params[:phone_number],
                         bio: params[:bio],
                         user_id: current_user.id
                        )
    if @contact.save
      render "show.json.jb"
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end  
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: {message: "Contact successfully destroyed"}
  end

end
