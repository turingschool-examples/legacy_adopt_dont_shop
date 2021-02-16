UserApplication.destroy_all



jeremiah = UserApplication.create!(name: 'Jeremiah',
                                     address: '123 Main St',
                                     city: 'Denver',
                                     state: 'CO',
                                     zip: '80234',
                                     description: 'I like turtles.',
                                     status: 'Accepted')
