# frozen_string_literal: true

Sequel.migration do
  transaction

  up do
    create_table(:example_table) do
      Serial    :table_id, primary_key: true
      String    :name, null: false
      Jsonb     :json_column
      TrueClass :active, default: true
      DateTime  :created_at, default: Sequel.function(:NOW)
    end

    create_table(:another_table) do
      String      :another_id, size: 50, primary_key: true
      foreign_key :table_id, :example_table, type: Integer, null: false
    end
  end
end
