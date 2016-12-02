# Elemeno

The official Ruby client for Elemeno, an API based CMS. Use this module to easily integrate your content created on Elemeno into your Ruby projects.

Create an account and get started for free at https://elemeno.io

## Requirements

- A minimum of Ruby 1.9.3
- [Bundler](http://bundler.io/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elemeno'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elemeno

## Elemeno Documentation

Documentation is available at http://docs.elemeno.io

## Usage

Include the Elemeno module:

```ruby
require "elemeno"
```

Create a new instance of the Elemeno Client with an API Key from your project

```ruby
elemeno = Elemeno::Client.new('123e4567-e89b-12d3-a456-426655440000')
```

**Note: API keys can be created in your project settings**

## Example Usage

```ruby
require "elemeno"

elemeno = Elemeno::Client.new('123e4567-e89b-12d3-a456-426655440000')

options = {
	'filters': {
		'$title': {
			'$contains': 'pie'
		}
	},
	'sort': {
		'$datePublished': 'ASC'
	},
	'page': 1,
	'size': 20
}

collectionItems = elemeno.getCollectionItems('recipes', options)
```

## API Overview

### Singles

#### `elemeno.getSingles([options])`

```ruby
options = {
	'sort': {
		'$dateUpdated': 'DESC'
	},
	'page': 1,
	'size': 20
}

singles = elemeno.getSingles(options)
```

#### `elemeno.getSingle(singleSlug)`

```ruby
single = elemeno.getSingle('about')
```

### Collections

#### `elemeno.getCollections([options])`

```ruby
options = {
	'sort': {
		'$dateCreated': 'DESC'
	},
	'page': 1,
	'size': 20
}

collections = `elemeno.getCollections(options)
```

#### `elemeno.getCollection(collectionSlug)`

```ruby
collection = `elemeno.getCollection('recipes')
```

#### `elemeno.getCollectionItems(collectionSlug, [options])`

```ruby
options = {
	'filters': {
		'$title': {
			'$contains': 'pie'
		}
	},
	'sort': {
		'$datePublished': 'ASC'
	},
	'page': 1,
	'size': 20
}

collectionItems = elemeno.getCollectionsItems('recipes', options)
```

#### `elemeno.getCollectionItems(collectionSluge, itemSlug, [options])`

```ruby
collectionItem = elemeno.getCollectionItem('recipes', 'applie-pie')
```

or `byId`:

```ruby
options = {
	'byId': true
}

collectionItem = elemeno.getCollectionItem('recipes', '281cf9b2-b355-11e6-b10e-5b3ff757fea2', options)
```
