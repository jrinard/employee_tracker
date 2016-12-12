require("spec_helper")

describe(Division) do
  describe("#employees") do
    it("tells which employees are in it") do
      test_division = Division.create({:name => "HR"})
      employee1 = Employee.create({:name => "Barry Allan", :division_id => test_division.id})
      employee2 = Employee.create({:name => "Bruce Wayne", :division_id => test_division.id})
    expect(test_division.employees()).to(eq([employee1, employee2]))
    end
  end
end
