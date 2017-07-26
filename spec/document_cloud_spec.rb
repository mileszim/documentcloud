require 'spec_helper'

describe DocumentCloud do
  it 'has a version number' do
    expect(DocumentCloud::Version).not_to be nil
  end

  it 'escapes characters in email addresses and passwords' do
    email = 'test@example.com'
    password = 'abc123$@#^&*%'

    DocumentCloud.configure do |config|
      config.email = email
      config.password = password
    end

    expect(DocumentCloud.client.instance_variable_get(:@email)).to eq CGI.escape(email)
    expect(DocumentCloud.client.instance_variable_get(:@password)).to eq CGI.escape(password)
  end
end
