class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table(:employees) do |emp|
      emp.column(:name, :string)
      emp.timestamps()
    end
   end
end
