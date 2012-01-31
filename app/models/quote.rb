class Quote < Node
  def min_hours
    children.inject(0) { |sum, child| sum += child.min_hours }
  end

  def max_hours
    children.inject(0) { |sum, child| sum += child.max_hours }
  end

  def create_in_xrono(client_id)
    # send the information in the proper format for Xrono to create a project based on Quote
    send_to_url = "http://192.168.1.83:3000"
    conn = Faraday.new(:url => send_to_url)
    response = conn.post("/api/v1/projects.json", {"project" => {"name" => self.description, "client_id" => client_id}})
    project_id = ActiveSupport::JSON.decode(response.body)["id"]
    self.update_attributes(:xrono_id => project_id)
    self.descendants.select{|p| p.type == "Item"}.each do |node|
      # create tickets using "items" as tickets, and sections as their naming schema 
      ticket_name = node.ancestors.map(&:description).push(node.description).join(' > ')
      resp = conn.post("/api/v1/tickets.json", {"ticket" => {"name" => ticket_name, "description" => ticket_name, "estimated_hours" => node.average_hours, "project_id" => self.xrono_id}})
    end
  end

  def to_param
    uuid
  end
end

