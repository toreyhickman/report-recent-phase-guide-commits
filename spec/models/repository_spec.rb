require_relative "../spec_helper"

describe Repository do
  let(:repository) do
    Repository.new({
      :name     => "phase-X-guide",
      :html_url => "https://github.com/some-org/phase-X-guide",
      :commits  => ["some commit"]
    })
  end

  it "has a name" do
    expect(repository.name).to eq "phase-X-guide"
  end

  it "has an html url" do
    expect(repository.html_url).to eq "https://github.com/some-org/phase-X-guide"
  end

  it "has commits" do
    expect(repository.commits).to match_array ["some commit"]
  end
end
