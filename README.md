# TODO

* Add enum for pet status
* Validations

# Adopt Don't Shop

## Learning Goals

* Build out CRUD functionality for a many to many relationship
* Validate models
* Use model validation to handle sad paths
* Use flash messages to give feedback to the user
* Create queries that utilize:
    * ActiveRecord Associations
    * ActiveRecord Calculations
    * `where`
    * `order`
    * `limit`
    * `joins`
* Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
* Use partials in views
* Use `within` and `before :each` blocks in tests
* Utilize a Project Management Tool
* Deploy an application to Heroku


## User Stories

```
[ ] done

Deploy your application to Heroku

As a visitor of the site
I will perform all user stories
By visiting the application on Heroku.
Localhost is fine for development, but
the application must be hosted on Heroku.
```

## Users

Our Application is going to need to track who is using it. To that end, we are going to create a `users` table. A User should have a name, street address, city, state, and zip.

In a fully functioning web application, users would normally need to log in with a password in order to do anything associated with that user's account. However, in this project we will not be adding any log in functionality.

Also notice that all User stories start with "As a visitor". A "visitor" is someone who is not logged into a user account. Since we are not adding any log in functionality, anyone using our application is considered a "visitor".

```
User Show Page

As a visitor
When I visit a User's show page
Then I see all of that User's information
Including the User's
  - Name
  - Street Address
  - City
  - State
  - Zip
```

```
New User

As a visitor
When I visit '/users/new'
I see a form to create a new user
When I fill in the form with my
  - Name
  - Street Address
  - City
  - State
  - Zip
Then I am taken to my new user's show page
And I see all of the information I entered in the form
```

```
New User Name must be Unique

As a visitor
When I try to create a new user
And I enter the name of a user that already exists in the database
Then I am taken back to the new user page
And I see a flash message that the user name has already been taken
```

## Apply for Pet(s)

Visitors to the site will be able to create applications to adopt pets. An application belongs to a user and has many pets. Pets can have many applications.

```
[ ] done

Application Show Page

As a visitor
When I visit an applications show page
Then I can see the following:
- Name of the User on the Application
- Full Address of the User on the Application
- Description of why the applicant says they'd be a good home for this pet(s)
- names of all pets that this application is for (all names of pets should be links to their show page)
- The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
```

```
[ ] done

Starting an Application

As a visitor
When I visit the pet index page
Then I see a link to "Start an Application"
When I click this link
Then I am taken to the new application page where I see a form to enter my user name
When I fill in this form with my user name (assuming I have already created a user in the system)
And I click submit
Then I am taken to the new application's show page
And I see my user listed along with all of my address information
And I see an indicator that this application is "In Progress"
```

```
[ ] done

Starting an Application, User not found

As a visitor
When I visit the new application page
And I fill in the form with the name of a User that doesn't exist in the database
And I click submit
Then I am taken back to the new applications page
And I see a message that the user could not be found.
```

```
[ ] done

Searching for Pets for an Application

As a visitor
When I visit an application's show page
And that application has not been submitted,
Then I see a section on the page to "Add a Pet to this Application"
In that section I see an input where I can search for Pets by name
When I fill in this field with a Pet's name
And I click submit,
Then I am taken back to the application show page
And under the search bar I see any Pet whose name matches my search
```

```
[ ] done

Add a Pet to an Application

As a visitor
When I visit an application's show page
And I search for a Pet by name
And I see the names Pets that matches my search
Then next to each Pet's name I see a button to "Adopt this Pet"
When I click one of these buttons
Then I am taken back to the application show page
And I see the Pet I want to adopt listed on this application
```

```
[ ] done

Submit an Application

As a visitor
When I visit an application's show page
And I have added one or more pets to the application
Then I see a section to submit my application
And in that section I see an input to enter why I would make a good owner for these pet(s)
When I fill in that input
And I click a button to submit this application
Then I am taken back to the application's show page
And I see an indicator that the application is "Pending"
And I see all the pets that I want to adopt
And I do not see a section to add more pets to this application
```

```
[ ] done

No Pets on an Application

As a visitor
When I visit an application's show page
And I have not added any pets to the application
Then I do not see a section to submit my application
```


```
[ ] done

Incomplete application for Pets

As a visitor
When I visit an application's show page
And I have added one or more pets to the application
And I fail to enter why I would make a good owner for these pet(s)
Then I am taken back to the application's show page
And I see a flash message that I need to fill out that field before I can submit the application
And I see my application is still "In Progress"
```

```
[ ] done

Partial Matches for Pet Names

As a visitor
When visit an application show page
And I search for Pets by name
Then I see any pet whose name PARTIALLY matches my search
For example, if I search for "fluff", my search would match pets with names "fluffy", "fluff", and "mr. fluff"
```

```
[ ] done

Case Insensitive Matches for Pet Names

As a visitor
When visit an application show page
And I search for Pets by name
Then my search is case insensitive
For example, if I search for "fluff", my search would match pets with names "Fluffy", "FLUFF", and "Mr. FlUfF"
```

## Approving Applications

Pets on an application can either be accepted or rejected. Once all pets on an application have been marked either accepted or rejected, then the application is no longer "Pending". If all the pets were accepted, then the application is accepted. If one or more pets on the application is rejected, then the entire application is rejected.

For this set of stories, we will be making routes that begin with '/admin'. This is to indicate that only a user with special privileges should be able to accept or reject pets on an application. Normally, we would want to make sure that a user is logged into an admin account before being able complete any of this workflow, but we will not add any log in or authorization functionality to this project.

```
[ ] done

Approving a Pet for Adoption

As a visitor
When I visit an admin application show page ('/admin/applications/:id')
For every pet that the application is for, I see a button to approve the application for that specific pet
When I click that button
Then I'm taken back to the admin application show page
And next to the pet that I approved, I do not see a button to approve this pet
And instead I see an indicator next to the pet that they have been approved
```

```
[ ] done

Rejecting a Pet for Adoption

As a visitor
When I visit an admin application show page ('/admin/applications/:id')
For every pet that the application is for, I see a button to reject the application for that specific pet
When I click that button
Then I'm taken back to the admin application show page
And next to the pet that I rejected, I do not see a button to approve or reject this pet
And instead I see an indicator next to the pet that they have been rejected
```

```
Approved/Rejected Pets on one Application do not affect other Applications

As a visitor
When there are two applications in the system for the same pet
When I visit the admin application show page for one of the applications
And I approve or reject the pet for that application
When I visit the other application's admin show page
Then I do not see that the pet has been accepted or rejected for that application
And instead I see buttons to approve or reject the pet for this specific application
```

```
[ ] done

All Pets Accepted on an Application

As a visitor
When I visit an admin application show page
And I approve all pets for an application
Then I am taken back to the admin application show page
And I see the application's status has changed to "Approved"
```

```
[ ] done

One or More Pets Rejected on an Application

As a visitor
When I visit an admin application show page
And I reject one or more pets for the application
And I approve all other pets on the application
Then I am taken back to the admin application show page
And I see the application's status has changed to "Rejected"
```

```
Application Approval makes Pets not adoptable

As a visitor
When I visit an admin application show page
And I approve all pets on the application
And when I visit the show pages for those pets
Then I see that those pets are no longer "adoptable"
```

```
Pets can only have one approved application on them at any time

[ ] done

As a visitor
When a pet has an "Approved" application on them
And when the pet has a "Pending" application on them
And I visit the admin application show page for pending application
Then next to the pet I do not see a button to approve them
And instead I see a message that this pet has been approved for adoption
And I do see a button to reject them
```

## Admin Shelter Views

```
Shelters with Pending Applications

As a visitor
When I visit the admin shelter index ('/admin/shelters')
Then I see a section for "Shelter's with Pending Applications"
And in this section I see the name of every shelter that has a pending application
```

```
Shelters with Pending Applications Listed Alphabetically

As a visitor
When I visit the admin shelter index ('/admin/shelters')
And I look in the section for shelters with pending applications
Then I see all those shelters are listed alphabetically
```

```
Admin Shelters Show Page Links

As a visitor
When I visit the admin shelter index ('/admin/shelters')
Then I see that every shelter name is a link
When I click one of these links
Then I am taken to that shelter's admin show page
```

```
Admin Shelters Show Page

As a visitor
When I visit an admin shelter show page
Then I see that shelter's name and full address
```

```
Average Pet Age

As a visitor
When I visit an admin shelter show page
Then I see a section for statistics
And in that section I see the average age of all adoptable pets for that shelter
```

```
Count of Adoptable Pets

As a visitor
When I visit an admin shelter show page
Then I see a section for statistics
And in that section I see the number of pets at that shelter that are adoptable
```

```
Count of Pets that have been Adopted

As a visitor
When I visit an admin shelter show page
Then I see a section for statistics
And in that section I see the number of pets that have been adopted from that shelter

Note: A Pet has been adopted from a shelter if they are part of an approved application
```

```
Action Required

As a visitor
When I visit an admin shelter show page
Then I see a section titled "Action Required"
In that section, I see a list of all pets for this shelter that have a pending application and have not yet been marked "approved" or "rejected"
```

```
Action Required Links to Application Show Page

As a visitor
When I visit an admin shelter show page
And I look in the "Action Required" section
Then next to each pet's name I see a link to the admin application show page where I can accept or reject the pet.
```




## Rubric
Note: In order to get 4's criteria under 4's must be completed.

| | **Feature Completeness** | **Rails** | **ActiveRecord** | **Testing and Debugging** |
| --- | --- | --- | --- | --- |
| **4: Exceptional**  | All User Stories 100% complete including all sad paths and edge cases, and some extension work completed | Students implement strategies not discussed in class to effectively organize code using POROs and adhere to MVC | Highly effective and efficient use of ActiveRecord beyond what we've taught in class. Even `.each` calls will not cause additional database lookups. | Very clear Test Driven Development. Test files are extremely well organized and nested. Students utilize `before :each` blocks. 100% coverage for features and models |
| **3: Passing** | Students complete all User Stories. No more than 2 Stories fail to correctly implement sad path and edge case functionality. | Students use the principles of MVC and POROs vs. Models to effectively organize code. Students can defend any of their design decisions. Action View helpers are used. Routes and Actions are following RESTful conventions. | ActiveRecord is used in a clear and effective way to read/write data using no Ruby to process data. Project fully leverages AR associations and methods | 100% coverage for models. 98% coverage for features. Tests are well written and meaningful. Scored a 3 or higher in Feature Completeness |
| **2: Passing with Concerns** | Students complete all but 1 - 3 User Stories | Students utilize MVC and POROs to organize code, but cannot defend some of their design decisions. Some routes and actions are not restful. | Ruby is used to process data that could use ActiveRecord instead. | Feature test coverage between 90% and 98%, or model test coverage below 100%, or tests are not meaningfully written or have an unclear objective. |
| **1: Failing** | Students fail to complete 4 or more User Stories | Students do not effectively organize code using MVC and/or POROs | Ruby is used to process data more often than ActiveRecord | Below 90% coverage for either features or models. |




## Extensions

```
List of Pets with Approved Applications

[ ] done

As a visitor
After an application has been approved for one or more pets
When I visit the favorites page
I see a section on the page that has a list of all of the pets that have an approved application on them
Each pet's name is a link to their show page
```

```
[ ] done

Reviews have a default picture

As a visitor
When I create a review for a shelter
And do not fill in the field for an image
A default image is used and displayed for that review upon submission
```

```
[ ] done

Sortable Reviews

As a visitor,
When I visit a shelter's show page to see their reviews,
I see additional links to sort their reviews in the following ways:
- sort reviews by highest rating, then by descending date
- sort reviews by lowest rating, then by ascending date
```

```
[ ] done

More Shelter Statistics

As a visitor,
When I visit the shelter's index page
I see the top 3 highest rated shelters highlighted on a specific part of the page
```























## Viewing Applications

```
[ ] done

Pet Applications Index Page

As a visitor
When I visit a pets show page
I see a link to view all applications for this pet
When I click that link
I can see a list of all the names of applicants for this pet
Each applicants name is a link to the application's show page
```


```
[ ] done

Pet Applications Index Page When No Applications

As a visitor
When I visit a pet applications index page for a pet that has no applications on them
I see a message saying that there are no applications for this pet yet
```
## Shelter Reviews

Users will be able to share their experiences with a shelter through providing reviews. Users should be able to create a review with a title (Example: "Awesome place!"), a rating (out of 5), and content (Example: "Truly enjoyed our time working with this shelter. Staff was great, and we found our perfect pet!"). A user can also upload one picture (image url address) for their review as well, but this is optional.

A review should belong to a Shelter, and belong to a User.

```
[ ] done

helter Reviews

As a visitor,
When I visit a shelter's show page,
I see a list of reviews for that shelter
Each review will have:
- title
- rating
- content
- an optional picture
- the name of the user that wrote the review
```

```
[ ] done

helter Review Creation

As a visitor,
When I visit a shelter's show page
I see a link to add a new review for this shelter.
When I click on this link, I am taken to a new review path
On this new page, I see a form where I must enter:
- title
- rating
- content
- the name of a user that exists in the database
I also see a field where I can enter an optional image (web address)
When the form is submitted, I should return to that shelter's show page
and I can see my new review
```

```
[ ] done

ser Reviews

As a visitor
When I visit a User's show page
Then I see every review this User has written
Including the review's title, rating, and content
```


```
[ ] done

dit a Shelter Review

As a visitor,
When I visit a shelter's show page
I see a link to edit the shelter review next to each review.
When I click on this link, I am taken to an edit shelter review path
On this new page, I see a form that includes that review's pre populated data:
- title
- rating
- content
- image
- the name of the user that wrote the review
I can update any of these fields and submit the form.
When the form is submitted, I should return to that shelter's show page
And I can see my updated review
```

```
[ ] done

elete a Shelter Review

As a visitor,
When I visit a shelter's show page,
Then I see a link next to each shelter review to delete the review.
When I click this link
Then I am returned to the shelter's show page
And I no longer see that shelter review
```


```
[ ] done

Shelter Review Creation, Incomplete Form

As a visitor,
When I visit the new review page
And I fail to enter a title, a rating, and/or content in the new shelter review form, but still try to submit the form
I see a flash message indicating that I need to fill in a title, rating, and content in order to submit a shelter review
And I'm returned to the new form to create a new review
```

```
[ ] done

Shelter Review Creation, User not Found

As a visitor,
When I visit the new review page
And I enter the name of a User that doesn't exist in the database, but still try to submit the form
I see a flash message indicating that the User couldn't be found
And I'm returned to the new form to create a new review
```

```
[ ] done

Edit a Shelter Review, Incomplete Form

As a visitor,
When I visit the page to edit a review
And I fail to enter a title, a rating, and/or content in the edit shelter review form, but still try to submit the form
I see a flash message indicating that I need to fill in a title, rating, and content in order to edit a shelter review
And I'm returned to the edit form to edit that review
```

```
[ ] done

Edit Shelter Review, User Not Found

As a visitor,
When I visit the page to edit a review
And I enter the name of a User that doesn't exist in the database, but still try to submit the form
I see a flash message indicating that the User couldn't be found
And I'm returned to the edit form to edit the review
```

## User Review Statistics

```
[ ] done

User Review Average Rating

As a visitor
When I visit a User's show page
Then I see the average rating of all of their reviews
```

```
[ ] done

Highlighted User Reviews

As a visitor
When I visit a User's show page
Then I see a section for "Highlighted Reviews"
And I see the review with the best rating that this user has written
And I see the review with the worst rating that this user has written
```


## Shelters
Visitors will have additional constraints when manipulating shelter data in the database.

```
[ ] done

Shelter Statistics

As a visitor
When I visit a shelter's show page
I see statistics for that shelter, including:
- count of pets that are at that shelter
- average shelter review rating
- number of applications on file for that shelter
```


```
[ ] done

Shelters with Pets that have pending status cannot be Deleted

As a visitor
If a shelter has approved applications for any of their pets
I can not delete that shelter
Either:
- there is no button visible for me to delete the shelter
- if I click on the delete link for deleting a shelter, I see a flash message indicating that the shelter can not be deleted.
```

```
[ ] done

Shelters can be Deleted as long as all pets do not have approved applications on them

As a visitor
If a shelter doesn't have any pets with an approved application
I can delete that shelter
When that shelter is deleted
Then all of their pets are deleted as well
```

```
[ ] done

Deleting Shelters Deletes its Reviews

As a visitor
When I delete a shelter
All reviews associated with that shelter are also deleted
```

## Pets

```
[ ] done

Pets with approved applications cannot be deleted

As a visitor
If a pet has an approved application on them
I can not delete that pet
Either:
- there is no button visible for me to delete the pet
- if I click on the delete button, I see a flash message indicating that the pet can not be deleted.
```
