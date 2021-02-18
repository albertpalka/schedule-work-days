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
  end
end
