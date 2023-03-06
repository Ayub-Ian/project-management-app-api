class Project < ActiveRecord::Base
    has_many :statuses
    has_many :members
    has_many :users, through: :members
end