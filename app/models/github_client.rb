module GithubClient
  HTTP_CLIENT = HTTParty
  DEFAULT_HEADERS = { "Accept"        => "application/vnd.github.v3+json",
                    "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
                    "User-Agent"    => "#{APP_NAME} (Ruby)" }

  def self.fetch_repository(org_name, repo_name)
    fetch(repo_endpoint(org_name, repo_name))
  end

  def self.fetch_merged_pull_requests(org_name, repo_name)
    fetch_closed_pull_requests_to_master(org_name, repo_name).reject do |pr|
      pr["merged_at"].nil?
    end
  end

  private

  def self.fetch(endpoint, query = {})
    response = HTTP_CLIENT.get(endpoint, { query: query, headers: DEFAULT_HEADERS })
    JSON.parse(response.body)
  end

  def self.fetch_closed_pull_requests_to_master(org_name, repo_name)
    fetch(pull_requests_endpoint(org_name, repo_name), { "base" => "master", "state" => "closed" })
  end

  def self.repo_endpoint(org_name, repo_name)
    "https://api.github.com/repos/#{org_name}/#{repo_name}"
  end

  def self.pull_requests_endpoint(org_name, repo_name)
    "https://api.github.com/repos/#{org_name}/#{repo_name}/pulls"
  end
end
