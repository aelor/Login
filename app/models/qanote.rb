class Qanote < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :task
  has_many :test
  has_many :stage
  has_many :live  
  attr_accessible :clientdetail, :productname, :projectname, :currenttag,
  :oldtag, :servername, :date, :developername, :gatekeeper, :uploadedfromtag, :tasknodetail,
  :patchnamedetail, :diff1, :diff2, :signature, :testedby, :user_id, :task_id
  
  validates :currenttag,:presence=>true, :format => { :with =>  /\A^[TSL]\-\d+\.\d+\.\d+$\z/ }, :uniqueness=> true, :on => :create
  
def self.search(search)
  if search
    where('clientdetail ILIKE ? OR developername ILIKE ? OR projectname ILIKE ? OR currenttag ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  else
    scoped
  end
end


end
