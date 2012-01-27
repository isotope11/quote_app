class Quote < Node
  def min_hours
    children.inject(0) { |sum, child| sum += child.min_hours }
  end

  def max_hours
    children.inject(0) { |sum, child| sum += child.max_hours }
  end

  def create_in_xrono
    # send the information in the proper format for Xrono to create a project based on Quote
    send_to_url = "http://192.168.1.83:3000"
    conn = Faraday.new(:url => send_to_url)
    response = conn.post("/api/v1/projects.json", {"client" => {"name" => self.business_name, "status" => "Inactive"}})
  end
end
