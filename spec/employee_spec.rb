require('spec_helper')

describe(Employee) do

  describe("#division") do
    it("tell which division the employee is apart of") do
        new_div = Division.create({:name => "Rob Corp"})
        new_emp = Employee.create({:name => "Not Rob", :division_id => new_div.id()})
        expect(new_emp.division()).to(eq(new_div))
    end
  end
end
