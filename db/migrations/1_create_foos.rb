Sequel.migration do
  up do
    create_table(:foos) do
      primary_key :id
      String :bar, :null=>false
    end
  end
  down do
    drop_table(:artists)
  end
end
