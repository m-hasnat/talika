require_relative "config/application"

Rails.application.load_tasks

namespace :graphql do
  task schema: :environment do
    TalikaSchema.to_definition.tap do |schema|
      File.write(Rails.root.join('schema.graphql'), schema)
      puts "Schema written to schema.graphql"
    end
  end
end
