require_relative "../spec_helper"

describe Repository do
  let(:old_pull_request) { double("pull request", { :merged_on_or_after? => false }) }
  let(:new_pull_request) { double("pull request", { :merged_on_or_after? => true }) }

  let(:repository) do
    Repository.new({
      :name           => "phase-X-guide",
      :html_url       => "https://github.com/some-org/phase-X-guide",
      :pull_requests  => [old_pull_request, new_pull_request]
    })
  end

  it "has a name" do
    expect(repository.name).to eq "phase-X-guide"
  end

  it "has an html url" do
    expect(repository.html_url).to eq "https://github.com/some-org/phase-X-guide"
  end

  it "has pull requests" do
    expect(repository.pull_requests).to match_array [old_pull_request, new_pull_request]
  end

  it "returns pull requests merged on or after a given date" do
    expect(repository.new_pull_requests(Date.parse("2017-01-01"))).to eq [new_pull_request]
  end
end
