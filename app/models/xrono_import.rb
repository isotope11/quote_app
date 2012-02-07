class XronoImport

  def initialize
    # define url for API and credentials
    api_url = ENV['QUOTE_APP_XRONO_URL']
    @email = ENV['QUOTE_APP_XRONO_USER']
    @password = ENV['QUOTE_APP_XRONO_PASS']
    @conn = Faraday.new(:url => api_url)
    # send login credentials to xrono and parse response for authenticity token
    token_response = @conn.post("/api/v1/tokens.json", {"email" => @email, "password" => @password})
    @auth_token = JSON.parse(token_response.body)["token"]
  end

  def get_clients
    response = @conn.get do |req|
      req.url "/api/v1/clients.json"
      req.params["auth_token"] = @auth_token
    end
    @clients = ActiveSupport::JSON.decode(response.body)
    return @clients
  end

  def send_quote(quote, client_id)
    # send the information in the proper format for Xrono to create a project based on Quote
    response = @conn.post("/api/v1/projects.json", {"auth_token" => @auth_token, "project" => {"name" => quote.description, "client_id" => client_id}})
    project_id = ActiveSupport::JSON.decode(response.body)["id"]
    quote.update_attributes(:xrono_id => project_id)
    quote.descendants.select{|p| p.type == "Item"}.each do |node|
      # create tickets using "items" as tickets, and sections as their naming schema 
      ancestors = node.self_and_ancestors
      ancestors.shift
      ticket_name = ancestors.map(&:description).join(' > ')
      resp = @conn.post("/api/v1/tickets.json", {"auth_token" => @auth_token, "ticket" => {"name" => ticket_name, "description" => ticket_name, "estimated_hours" => node.average_hours, "project_id" => quote.xrono_id}})
    end
  end
end
