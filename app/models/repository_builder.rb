class RepositoryBuilder

  def initialize(org_name, repo_name, client = GithubClient)
    @org_name  = org_name
    @repo_name = repo_name
    @client    = client
  end

  def build_repository_with_merged_pull_requests(merge_date_cutoff)
    Repository.new({
      :name          => extract_name_from_repository_data,
      :html_url      => extract_html_url_from_repository_data,
      :pull_requests => build_pull_requests(merge_date_cutoff)
    })
  end

  private
  attr_reader :org_name, :repo_name, :client

  def repository_data
    @repository_data ||= client.fetch_repository(org_name, repo_name)
  end

  def extract_name_from_repository_data
    repository_data["name"]
  end

  def extract_html_url_from_repository_data
    repository_data["html_url"]
  end

  def build_pull_requests(merge_date_cutoff)
    pull_request_data.each_with_object([]) do |data, pull_requests|
      merge_date = Date.parse(extract_pull_request_merged_at(data))

      if merge_date >= merge_date_cutoff
        pull_requests << PullRequest.new({ :title     => extract_pull_request_title(data),
                                           :html_url  => extract_pull_request_html_url(data),
                                           :merged_at => merge_date
                                         })
      end
    end
  end

  def pull_request_data
    @pull_request_data ||= client.fetch_merged_pull_requests(org_name, repo_name)
  end

  def extract_pull_request_title(data)
    data["title"]
  end

  def extract_pull_request_html_url(data)
    data["html_url"]
  end

  def extract_pull_request_merged_at(data)
    data["merged_at"]
  end
end
