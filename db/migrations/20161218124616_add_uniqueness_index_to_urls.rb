Hanami::Model.migration do
  change do
    add_index :urls, :address, unique: true
  end
end
