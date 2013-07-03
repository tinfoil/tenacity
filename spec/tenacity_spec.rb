require 'spec_helper'
describe Tenacity do

  let!(:firm) { create(:firm) }
  let!(:employees) { create_list(:employee, 5, firm_id: firm.id) }
  let!(:documents) { create_list(:document, 5, firm_id: firm.id) }

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

  context 'when associating an ActiveRecord object and a Mongoid object' do
    it 'returns proper has_many results' do
      Firm.find(firm.id).documents.count.should be(5)
    end
  end
end