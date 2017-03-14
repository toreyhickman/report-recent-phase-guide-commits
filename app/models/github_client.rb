module GithubClient
  HTTP_CLIENT = HTTParty
  DEFAULT_HEADERS = { "Accept"        => "application/vnd.github.v3+json",
                    "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
                    "User-Agent"    => "#{APP_NAME} (Ruby)" }

  def self.fetch_repository(org_name, repo_name)
    fetch(repo_endpoint(org_name, repo_name))
  end

  private

  def self.fetch(endpoint)
    response = HTTP_CLIENT.get(endpoint, { headers: DEFAULT_HEADERS })
    JSON.parse(response.body)
  end

  def self.repo_endpoint(org_name, repo_name)
    "https://api.github.com/repos/#{org_name}/#{repo_name}"
  end
end
