class Application < ApplicationRecord
  enum status: ['In Progress', 'Pending', 'Accepted', 'Rejected']
end
