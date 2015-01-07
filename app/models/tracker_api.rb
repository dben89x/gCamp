class TrackerAPI
  def initialize
    @conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
  end

  def get_projects(token)
    response = @conn.get do |req|
      req.url "/services/v5/projects"
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_stories(token, project_id)
    # get_response(token, "/services/v5/projects/#{project_id}/stories")
    response = @conn.get do |req|
      req.url "/services/v5/projects/#{project_id}/stories"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  # def get_response(token, url)
  #   response = @conn.get do |req|
  #     req.url "/services/v5/projects/#{project_id}/stories"
  #     req.headers['Content-Type'] = 'application/json'
  #     req.headers['X-TrackerToken'] = token
  #   end
  #   JSON.parse(response.body, symbolize_names: true)
  # end
end
