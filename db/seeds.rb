UserApplication.destroy_all

jeremiah = UserApplication.create!(name: 'Jeremiah',
                                   address: '1234 Main St',
                                   city: 'Denver',
                                   state: 'CO',
                                   zip_code: 80234,
                                   description: 'I like turtles.',
                                   status: 'Accepted')
