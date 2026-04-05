module GraphqlHelpers
  def execute_query(query_string, variables: {}, context: {})
    TalikaSchema.execute(
      query_string,
      variables: variables,
      context: context
    )
  end
end
