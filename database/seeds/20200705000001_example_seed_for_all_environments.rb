# frozen_string_literal: true

Sequel.seed(:development, :production, :test) do
  def run
    Services[:database][:example_table].insert(name: 'Example name')
  end
end
