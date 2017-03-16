require_relative "../../spec_helper"

describe Email::HTMLEmail do
  let(:email) { Email::HTMLEmail.new(repositories) }
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

  it "includes an introduction" do
    expect(email.body).to include Email::Introduction
  end

  describe "listing the repositories" do
    it "includes the repository names" do
      expect(email.body).to include "Repo 1 Name"
      expect(email.body).to include "Repo 2 Name"
    end

    it "includes the titles of the merged pull requests" do
      expect(email.body).to include "Pull Request 1"
      expect(email.body).to include "Pull Request 2"
      expect(email.body).to include "Pull Request 3"
      expect(email.body).to include "Pull Request 4"
    end
  end
end
