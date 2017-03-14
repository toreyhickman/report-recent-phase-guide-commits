require_relative "../spec_helper"

describe Repository do
  let(:repository) do
    Repository.new({
      :name           => "phase-X-guide",
      :html_url       => "https://github.com/some-org/phase-X-guide",
      :pull_requests  => ["some pull request"]
    })
  end

  it "has a name" do
    expect(repository.name).to eq "phase-X-guide"
  end

  it "has an html url" do
    expect(repository.html_url).to eq "https://github.com/some-org/phase-X-guide"
  end

  it "has pull requests" do
    expect(repository.pull_requests).to match_array ["some pull request"]
  end
end
