class Rider < AppRecord

  belongs_to :user

  has_many :rides

end
