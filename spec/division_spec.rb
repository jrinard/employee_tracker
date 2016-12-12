require("spec_helper")

describe(Division) do
  describe("#employees") do
    it("tells which tasks are in it") do
      division = Division.create({:name => "HR"})
      employee1 = Employee.create({:name => "Barry Allan", :division_id => division.id})
      employee2 = Employee.create({:name => "Bruce Wayne", :division_id => division.id})
    expect(division.employees()).to(eq([employee1, employee2]))
    end
  end
end
