class Url < Hanami::Entity
  def status
    start_time = Time.now
    message = (ping || net_open)
    unless message
      end_time = Time.now
      message = { online: false, duration: format_time(end_time - start_time) }
    end
    message
  end

  private

  def ping
    connection = Net::Ping::HTTP.new(address)
    if connection.ping?
      { online: true, duration: format_time(connection.duration) }
    end
  rescue
    false
  end

  def net_open
    start_time = Time.now
    if Timeout.timeout(10) { open(address, allow_redirections: :safe).status == %w(200 OK) }
      end_time = Time.now
      { online: true, duration: format_time(end_time - start_time) }
    end
  rescue
    false
  end

  def format_time(time_in_seconds)
    format('%.1f', (time_in_seconds * BigDecimal(100)).to_f)
  end
end
