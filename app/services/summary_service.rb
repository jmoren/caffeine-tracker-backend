class SummaryService
  attr_reader :user, :summary, :error

  def initialize(user, start_date, end_date)
   @user = user
   @start_date = start_date&.to_date
   @end_date = end_date&.to_date

   @success =  false
   @error = nil
  end

  def call
    raise RuntimeError, "Can not get summary without date" if @start_date.nil?
    @summary = {}
    @data = UserDrink.none
    generate_report
    self
  rescue => e
    @success = false
    @error = e.message
    self
  ensure
    self
  end

  def success?
    @success = true
  end

  private

  def generate_report
    if @end_date.present?
      @data = UserDrink.where(user_id: user.id).where(consumed_at: @start_date..@end_date)
    else
      @data = UserDrink.where(user_id: user.id).where("DATE(consumed_at) = ?", @start_date)
    end

    parse_data
  end

  def parse_data
    list = @data.map { |record| real_caffeine(record.drink.caffeine, record.level) }
    @summary  = {
      sum: list.sum,
      avg: (list.sum / 7.0).round(2),
      max: list.max,
      total_drinks: @data.count
    }
  end

  def real_caffeine(value, level)
    puts "#{value} and level: #{level}"
    c = case level
    when "full"
      value
    when "half"
      value / 2.0
    when "some"
      value / 4.0
    else
      0
    end
  end
end
