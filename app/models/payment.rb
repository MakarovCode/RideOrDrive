class Payment < AppRecord

  belongs_to :user
  belongs_to :ride

  PENDING = 0
  VOIDED = 2
  DECLINED = 3
  ERROR = 4
  APPROVED = 5

  DIC_STATUSES = {"APPROVED" => APPROVED, "VOIDED" => VOIDED, "DECLINED" => DECLINED, "ERROR" => ERROR, PENDING => "PENDING"}

  STATUSES = [PENDING, VOIDED, DECLINED, ERROR, APPROVED]

  def translate_status(status)
    self.status = DIC_STATUSES[status]
  end

end
