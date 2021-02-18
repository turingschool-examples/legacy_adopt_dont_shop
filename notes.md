

<% @applications.each do |application| %>
  <p><a href="/applications/<%= application.id %>"><%= application.name %></a></p> <p><a href="/applications/<%= application.id %>/edit">Update Application</p>
    <form action="/applications/<%= application.id %>" method="POST">
      <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
      <input type="hidden" name="_method" value="DELETE">
      <input type="submit" value="Delete Application"/>
    </form>
  <br>
<% end %>





update the pet model test
make an application model test



a migration that acts as a join table to join pets and applications
rails g migration CreateApplicationsPets application:references pet:references
add timestamps
an application_pet model that belongs_to :pet
an application_pet model that belongs_to :application

i need to instantiate the application_pet using the syntax
application_pet.create(application: application_1, pet: pet_1)
