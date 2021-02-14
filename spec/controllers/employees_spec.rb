require 'rails_helper'

RSpec.describe EmployeesController, type: :request do
  let(:employee) { FactoryBot.create(:employee) }

  describe 'HTTP requests' do
    it 'GET #index' do
      get employees_path
      expect(response).to have_http_status(200)
    end

    it 'GET #edit' do
      get edit_employee_path(employee)
      expect(response).to have_http_status(200)
    end

    it 'GET #new' do
      get new_employee_path
      expect(response).to have_http_status(200)
    end

    it 'GET #show' do
      get employee_path(employee)
      expect(response).to have_http_status(200)
    end

    # it 'PUT employee' do
    #   put employee_path(employee.id, full_name: 'Test')
    #   expect(response).to have_http_status(200)
    # end

    # it 'POST #new with valid data' do
    #   post new_employee_path, params: { full_name: 'test' }
    #   expect(response).to be_redirect
    # end

    # it 'POST #new with invalid data'
  end
end
