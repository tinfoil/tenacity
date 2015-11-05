ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:')

ActiveRecord::Schema.define version: 0 do
  create_table :firms, force: true do |t|
    t.string :name
  end

  create_table :employees, force: true do |t|
    t.string :first_name
    t.string :last_name
    t.integer :firm_id
  end

  create_table :comments, force: true do |t|
    t.string :comment
    t.string :commentable_id
    t.string :commentable_type
  end
end