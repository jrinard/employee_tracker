class EmployeeIdFix < ActiveRecord::Migration[5.0]
  def change
    add_column(:employees, :division_id, :integer)
    remove_column(:divisions, :employee_id)
  end
end
