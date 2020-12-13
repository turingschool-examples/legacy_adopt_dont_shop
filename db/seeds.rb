UserApplication.destroy_all



isabelle = UserApplication.create!(name: 'Isabelle',
                                     address: '1234 Downing St', 
                                     city: 'Denver', 
                                     state: 'CO', 
                                     zip: '80218',
                                     description: 'i give a lot of pets to my pets.',
                                     status: 'Accepted')