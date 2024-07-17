# db/seeds.rb
# Create Departments
departments = Department.create([
  { name: 'Engineering' },
  { name: 'Human Resources' },
  { name: 'Finance' }
])

# Create Employees
employees = Employee.create([
  { name: 'John Doe', email: 'john.doe@example.com', department: departments.first, employment_status: 'active' },
  { name: 'Jane Smith', email: 'jane.smith@example.com', department: departments.last, employment_status: 'active' },
  { name: 'Alice Johnson', email: 'alice.johnson@example.com', department: departments.first, employment_status: 'terminated' }
])

# Create Admins
admins = Admin.create([
  { email: 'admin1@example.com' },
  { email: 'admin2@example.com' }
])

# Create Expenses
expenses = Expense.create([
  { employee: employees.first, date: Date.today, description: 'Cab to airport', amount: 50.0, invoice_number: 2, supporting_document: 'cab_invoice.pdf', status: 'pending' },
  { employee: employees.first, date: Date.today, description: 'Hotel accommodation', amount: 100.0, invoice_number: 4, supporting_document: 'hotel_invoice.pdf', status: 'pending' },
  { employee: employees.first, date: Date.today, description: 'Food', amount: 30.0, invoice_number: 1, supporting_document: 'food_invoice.pdf', status: 'pending' }
])

# Create Expense Reports
expense_reports = ExpenseReport.create([
  { employee: employees.first, status: 'pending', comments: 'Business trip to Delhi' }
])

# Associate Expenses with Expense Report
expenses.each do |expense|
  expense.update(expense_report: expense_reports.first)
end
