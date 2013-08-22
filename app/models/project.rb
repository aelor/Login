class Project < ActiveRecord::Base
  belongs_to :client
  has_many :tasks
  attr_accessible :project_name, :client_id, :client_name
end
