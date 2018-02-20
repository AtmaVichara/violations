class Violation

  def initialize(row)
    @data = row[:date]
    @id = row[:id]
    @violation_type = row[:violation_type]
  end

end 
