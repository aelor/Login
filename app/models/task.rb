class Task < ActiveRecord::Base
  belongs_to :client
  belongs_to :project
  belongs_to :user
  has_many :qanotes
  attr_accessible :task_name, :task_description, :task_assigned_to, :client_id, :project_id, :user_id
  
  validates :task_name, :format => { :with =>  /\A^[TSL]\-\d+\.\d+\.\d+$\z/ , :on => :create}, :uniqueness=> true
end
