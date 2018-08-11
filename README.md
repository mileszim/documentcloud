# DocumentCloud RubyGem #
[![Gem Version](https://badge.fury.io/rb/documentcloud.png)](http://badge.fury.io/rb/documentcloud)
[![Build Status](https://travis-ci.org/mileszim/documentcloud.svg?branch=master)](https://travis-ci.org/mileszim/documentcloud)

Rubygem for interacting with the DocumentCloud API


## Install ##
Add to your Gemfile
``` ruby
gem 'documentcloud', '~> 0.5.0'
```

## Authentication ##

#### Ruby applications or Rails < 5.1 ####
Use a gem like dotenv or manually add them:

``` bash
$ DOCUMENTCLOUD_EMAIL='myemail@emailprovider.tld' \
DOCUMENTCLOUD_PASSWORD='my super secure password' \
ruby main.rb
```

You can then initialize using `ENV['DOCUMENTCLOUD_EMAIL']` (and pass) in either client or for rails, an initializer:

Add file `config/intializers/documentcloud.rb`:
``` ruby
DocumentCloud.configure do |config|
  config.email = ENV['DOCUMENTCLOUD_EMAIL']
  config.password = ENV['DOCUMENTCLOUD_PASSWORD']
end
```


#### Rails >= 5.1 ####
Add file `config/intializers/documentcloud.rb`:
``` ruby
DocumentCloud.configure do |config|
  config.email = Rails.application.credentials.documentcloud[:email]
  config.password = Rails.application.credentials.documentcloud[:password]
end
```

##### Rails 5.1 #####
[Add your documentcloud credentials using Rails 5.1 encrypted secrets](https://www.engineyard.com/blog/encrypted-rails-secrets-on-rails-5.1)

##### Rails 5.2 #####
[Add your documentcloud credentials using Rails 5.2 encrypted secrets](https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336)


### Search ###
All search results return Document objects that has methods and accessors for the information.

``` ruby
search = DocumentCloud.search('my query')

puts search.total # returns number of results

puts search.documents[0].pdf
```


### Upload ###
You can upload a document by providing a ruby File object, or a string with the url to a file.

``` ruby
local_doc = DocumentCloud.upload(File.new('/my/file/path.pdf','rb'), 'My Document Title')

remote_doc = DocumentCloud.upload('http://somesite.com/file.pdf', 'Document Title')
```

Both return a document object which can then be used.


## Objects ##
This gem creates several objects built from the JSON response in order to provide convenience methods and accessors.

### Document ###
Document objects wrap any document JSON. They are returned in search results, upload, and document methods.

``` ruby
doc = DocumentCloud.document('1234-document-id')

# Accessors
doc.id
doc.title
doc.access
doc.pages
doc.description
doc.source
doc.canonical_url
doc.language
doc.display_langauge

# Methods
doc.pdf               # Full URL to pdf
doc.print_annotations
doc.related_article
doc.text              # Raw parsed text from document
doc.thumbnail         # Primary thumbnail of document
doc.entities          # Returns a hash of entities and their relevance

# Images
doc.image(page, size) # Returns the image of a page at the specified size
```

### Search Results ###
SearchResults objects return information about the search, and an array of Document objects

``` ruby
results = DocumentCloud.search('my query')

results.total    # Total number of results
results.page     # The current results page. Used by specifying page param: DocumentCloud.search('my query', page: 2)
results.per_page # Number of results per page
results.query    # Query string

results.documents # Array of documents of results:

results.documents[0].title # First result title
```

### Projects ###
Projects returns an array of Project objects which contain a list of Documents and
metadata about the project.

``` ruby
projects = DocumentCloud.projects

project = projects.first

# Accessors
project.id
project.title
project.description
project.documents # Returns an array of Document objects
```

### Entities ###
Entities takes a document id and returns a hash of entities, which
include a value and relevance for each type of entity.

``` ruby
entities = DocumentCloud.entities(2072158)

# example output
{
  :person => [
    { :value => "Pita Sharples", :relevance => 0.112 }
  ],
  :organization => [
    { :value => "Māori Party", :relevance => 0.48 }
  ],
  :place => [],
  :term => [
    { :value => "finance costs", :relevance => 0.552 },
    { :value => "public services", :relevance => 0.526 }
  ],
  :email => [],
  :phone => [],
  :city => [],
  :state => [],
  :country => [
    { :value => "New Zealand", :relevance => 0.628 },
    { :value => "Australia", :relevance => 0.302 },
    { :value => "United States", :relevance => 0.295 },
    { :value => "United Kingdom", :relevance => 0.295 },
    { :value => "China", :relevance => 0.294 }
  ]
}
```


## Information ##

DocumentCloud API info: http://www.documentcloud.org/help/api
