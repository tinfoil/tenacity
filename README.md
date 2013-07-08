#Tenacity

[![Build Status](https://travis-ci.org/market76/tenacity.png?branch=develop)](https://travis-ci.org/market76/tenacity)

A database client independent way of managing relationships between models
backed by different databases.

Tenacity is heavily based on ActiveRecord's associations, and aims to behave in
much the same way, supporting many of the same options.

### Install
```ruby
# In Gemfile
gem 'tenacity', git: 'git@github.com:market76/tenacity.git', branch: 'master'
```

### Example
```ruby
class Comment < ActiveRecord::Base
  include Tenacity

  t_belongs_to :commentable, polymorphic: true
end

class Firm < ActiveRecord::Base
  include Tenacity

  t_has_many :employees
  t_has_many :documents

  t_has_many :comments, as: :commentable, dependent: :destroy
end
```

### Additional Usage Details

The directories that contain your model classes must be in your load path in order for Tenacity to find them.

####Supported Database Clients

* ActiveRecord
* Mongoid