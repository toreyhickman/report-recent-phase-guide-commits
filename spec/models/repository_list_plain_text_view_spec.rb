require_relative "../spec_helper"

describe RepositoryListPlainTextView do
  let(:view) { RepositoryListPlainTextView.new(repositories) }
  let(:output) { view.render }
  let(:repositories) { [repo_1, repo_2] }

  (1..4).each do |n|
    let(:"pull_request_#{n}") { double("pull request", { :title => "Pull Request #{n}" }) }
  end

  let(:repo_1) do
    double("repository", {
      :name          => "Repo 1 Name",
      :html_url      => "https://github.com/some/path/1",
      :pull_requests => [pull_request_1, pull_request_2]
    })
  end

  let(:repo_2) do
    double("repository", {
      :name          => "Repo 2 Name",
      :html_url      => "https://github.com/some/path/2",
      :pull_requests => [pull_request_3, pull_request_4]
    })
  end

  describe "rendering a list of repositories" do
    it "includes the repository names" do
      expect(output).to include "Repo 1 Name"
      expect(output).to include "Repo 2 Name"
    end

    it "includes the titles of the merged pull requests" do
      expect(output).to include "Pull Request 1"
      expect(output).to include "Pull Request 2"
      expect(output).to include "Pull Request 3"
      expect(output).to include "Pull Request 4"
    end
  end
end
