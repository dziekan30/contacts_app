class Api::ContactsController < ApplicationController

  def contact_all
    @contact = Contact.first
    render  "contacts_all_view.json.jb"

  end

  def all_contacts
    @contacts = Contact.all
    render "all_contacts.json.jb"
  end
end
