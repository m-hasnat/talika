# Talika (تালিকা)

A GraphQL Rails API that serves directory data from YAML files. Built to be reusable across multiple frontends and directory types.

## What It Does

- Serves structured directory data via GraphQL
- Data lives in YAML files — no database needed
- Supports search, filter, and sort out of the box
- Designed to power multiple directory types: AI tools, ABA centers, mosques, and more

## Current Directories

- **AI Tools** — searchable catalog of AI tools with category, pricing, and API availability

## Stack

- Ruby on Rails 8 (API mode)
- GraphQL Ruby 2.x
- YAML data source
- RSpec test suite

## Setup

```bash
git clone https://github.com/m-hasnat/talika.git
cd talika
bundle install
rails server
```

## GraphQL Playground

Visit `http://localhost:3000/graphiql` in development.

## Example Query

```graphql
{
  aiTools(category: "LLM", sort: "name") {
    name
    description
    category
    url
    pricing
    apiAvailable
  }
}
```

## Query Arguments

| Argument | Type   | Description                |
| -------- | ------ | -------------------------- |
| search   | String | Filter by name             |
| category | String | Filter by category         |
| sort     | String | Sort by field (use "name") |

## Adding a New Directory

1. Add a new YAML file to `data/`
2. Create a new type in `app/graphql/types/output/`
3. Create a new resolver in `app/graphql/resolvers/fetch/`
4. Add the field to `app/graphql/types/query_type.rb`

## Running Tests

```bash
bundle exec rspec
```

## Future Improvements

- Add ABA centers directory
- Add mosques directory
- Add pagination
- Add database backend option
- Add mutations for admin data management
