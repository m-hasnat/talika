require "ostruct"

module Resolvers
  module Fetch
    class AiTools < GraphQL::Schema::Resolver
      ToolStruct = Struct.new(
        :name, :description, :category, :url,
        :docs_url, :icon, :pricing, :api_available, :tags,
        keyword_init: true
      )

      type [ Types::Output::AiTool ], null: false

      argument :search, String, required: false
      argument :category, String, required: false
      argument :sort, String, required: false

      def resolve(search: nil, category: nil, sort: nil)
        tools = load_tools

        tools = tools.select { |t| t["name"].downcase.include?(search.downcase) } if search.present?
        tools = tools.select { |t| t["category"].downcase == category.downcase } if category.present?
        tools = tools.sort_by { |t| t["name"] } if sort == "name"

        tools.map { |t| ToolStruct.new(**t.transform_keys(&:to_sym)) }
      end

      private

      def load_tools
        YAML.load_file(Rails.root.join("data/ai_tools.yml"))
      end
    end
  end
end
