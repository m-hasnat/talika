require 'rails_helper'

RSpec.describe Resolvers::Fetch::AiTools do
  describe 'aiTools query' do
    it 'returns all tools' do
      result = execute_query('{ aiTools { name category } }')
      expect(result['data']['aiTools']).not_to be_empty
    end

    it 'returns correct fields' do
      result = execute_query('{ aiTools { name category description } }')
      tool = result['data']['aiTools'].first
      expect(tool).to have_key('name')
      expect(tool).to have_key('category')
      expect(tool).to have_key('description')
    end

    it 'filters by search' do
      result = execute_query('{ aiTools(search: "cursor") { name } }')
      tools = result['data']['aiTools']
      expect(tools.length).to eq(1)
      expect(tools.first['name']).to eq('Cursor')
    end

    it 'filters by category' do
      result = execute_query('{ aiTools(category: "LLM") { name category } }')
      tools = result['data']['aiTools']
      expect(tools).not_to be_empty
      expect(tools.all? { |t| t['category'] == 'LLM' }).to be true
    end

    it 'sorts by name' do
      result = execute_query('{ aiTools(sort: "name") { name } }')
      names = result['data']['aiTools'].map { |t| t['name'] }
      expect(names).to eq(names.sort)
    end

    it 'returns no results for unknown search' do
      result = execute_query('{ aiTools(search: "xyznonexistent") { name } }')
      expect(result['data']['aiTools']).to be_empty
    end
  end
end
