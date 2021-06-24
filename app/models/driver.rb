class Driver < AppRecord

  ACTIVE = 0
  INACTIVE = 1

  DUMMY_POSITIONS = [[5.055796453023791, -75.48495793770049, "CC Cable Plaza"], [5.065172178749713, -75.48977264234462, "CC Mall Plaza"], [5.054242360414919, -75.47943800803698, "Homecenter"], [5.052285140908884, -75.48977264234462, "CC Sancancio"], [5.0686035953076765, -75.5113605457166, "CC Fundadores"]]

  STATUSES = [ACTIVE, INACTIVE]

  belongs_to :user

  has_many :rides

  scope :search_by, -> (lat, lng){
    where(current_lat: lat, current_lng: lng) # Mejorar con geocoding
  }

end
