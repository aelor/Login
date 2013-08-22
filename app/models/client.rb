class Client < ActiveRecord::Base
 has_many :projects
 has_many :tasks
 attr_accessible :client_name
end
