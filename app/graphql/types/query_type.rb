module Types
  class QueryType < Types::BaseObject
    field :ai_tools, resolver: Resolvers::Fetch::AiTools
  end
end
