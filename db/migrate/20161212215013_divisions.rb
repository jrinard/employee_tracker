class Divisions < ActiveRecord::Migration[5.0]
  def change
    create_table(:divisions) do |d|
      d.column(:name, :string)
      d.column(:employee_id, :integer)

      d.timestamps()
    end
  end
end
