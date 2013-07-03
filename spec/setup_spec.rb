require 'spec_helper'
describe Tenacity do

  let!(:firm) { create(:firm) }
  let!(:employees) { create_list(:employee, 5, firm_id: firm.id) }

  context 'when associating two ActiveRecord objects' do
    it 'returns proper has_many results' do
      Firm.find(firm.id).employees.count.should be(5)
    end

    it 'returns proper belongs_to results' do
      Employee.where(firm_id: firm.id).each do |employee|
        employee.firm.id == firm.id
      end
    end
  end

  it 'makes a document' do
    Document.create(name: 'Testing')
    Document.all.count.should be(1)
  end
end