require_relative '../lib/document_cloud'

describe "DocumentCloud" do
  before do
    DocumentCloud.configure do |config|
      config.email = "test@testmail.com"
      config.password = "password"
    end
  end

  it "is has a version" do
    expect(DocumentCloud::Version).not_to be nil
  end

  it "lazy instantiates a client" do
    expect(DocumentCloud.client?).to be false
    DocumentCloud.client
    expect(DocumentCloud.client?).to be true
  end

  it "has a client" do
    expect(DocumentCloud.client).to_not be nil
  end

  it "has a singleton client" do
    c1 = DocumentCloud.client
    c2 = DocumentCloud.client
    expect(c1).to equal c2
    expect(c2).to equal c1
  end

  it "delegates methods to client" do
    skip
  end

  describe "DocumentCloud::Configurable" do
    it "injects itself into DocumentCloud" do
      skip
    end
  end
end
