Hanami::Model.migration do
  up do
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_table! :urls do
      primary_key :id

      column :title, String, null: false
      column :address, String, null: false
      column :token, 'uuid', null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    add_index :urls, :address
    add_index :urls, [:address, :token], name: :address_token_index, unique: true
  end

  down do
    create_table! :urls do
      primary_key :id

      column :title, String, null: false
      column :address, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    add_index :urls, :address, unique: true

    execute 'DROP EXTENSION IF EXISTS "uuid-ossp"'
  end
end
