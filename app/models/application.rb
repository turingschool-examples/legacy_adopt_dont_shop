class Application < ApplicationRecord
  # enum status: ['In Progress,', 'Pending', 'Accepted', 'Rejected']
end

rails g migration CreateApplications name:string address:string city:string state:string zip:integer description:text status:integer
