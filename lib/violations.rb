class Violation

  attr_reader :id, :date, :violation_type

  def initialize(row)
    @date = row[:violation_date]
    @id = row[:id]
    @violation_type = row[:violation_type]
  end

end
