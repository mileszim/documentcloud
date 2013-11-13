DocumentCloud RubyGem
=====================

Rubygem for interacting with the DocumentCloud API


## Usage

```gem install documentcloud``` or put in your gemfile and ```bundle install```

To authenticate, initialize the configuration and pass in a block:

``` ruby
DocumentCloud.configure do |config|
  config.email    = 'my_email@somedomain.com'
  config.password = 'my_secret_password'
end
```


### Search

All search results return Document objects that has methods and accessors for the information.

``` ruby
search = DocumentCloud.search('my query')

puts search.total # returns number of results

puts search.documents[0].pdf
```


### Upload

You can upload a document by providing a ruby File object, or a string with the url to a file.

``` ruby
local_doc = DocumentCloud.upload(File.new('/my/file/path.pdf','rb), 'My Document Title')

remote_doc = DocumentCloud.upload('http://somesite.com/file.pdf', 'Document Title')
```

Both return a document object which can then be used.


### Information

DocumentCloud API info: http://www.documentcloud.org/help/api