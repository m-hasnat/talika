module Types
  module Output
    class AiTool < Types::BaseObject
      field :name, String, null: false
      field :description, String, null: false
      field :category, String, null: false
      field :url, String, null: false
      field :docs_url, String, null: true
      field :icon, String, null: true
      field :pricing, String, null: true
      field :api_available, Boolean, null: true
      field :tags, [ String ], null: true
    end
  end
end
