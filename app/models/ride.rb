class Ride < AppRecord

  belongs_to :rider
  belongs_to :driver
  has_one :payment

  DUMMY_POSITIONS = [[5.0607434, -75.4922828, "CC Cable Plaza"], [5.0607434,-75.4922828, "CC Mall Plaza"], [5.0607434,-75.4922828, "Homecenter"], [5.0559582,-75.4904252, "CC Sancancio"], [5.0693784,-75.5182895, "CC Fundadores"]]

  CANCELLED = 0
  PENDING = 0
  IN_PROGRESS = 1
  FINISHED = 2

  STATUSES = [CANCELLED, PENDING, IN_PROGRESS, FINISHED]

  def distance_traveled
    10
  end

  def time_elapsed
    10
  end
end
