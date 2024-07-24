# db/seeds.rb

# Create Admins
admin1 = Admin.create!(email: 'admin1@example.com')
admin2 = Admin.create!(email: 'admin2@example.com')

# Create Departments
department1 = Department.create!(name: 'Finance')
department2 = Department.create!(name: 'Human Resources')
department3 = Department.create!(name: 'Engineering')

# Create Employees
employee1 = Employee.create!(name: 'John Doe', email: 'john.doe@example.com', department: department1, employment_status: 'active', role: 'NON_ADMIN')
employee2 = Employee.create!(name: 'Jane Smith', email: 'jane.smith@example.com', department: department2, employment_status: 'active', role: 'NON_ADMIN')
employee3 = Employee.create!(name: 'Alice Johnson', email: 'alice.johnson@example.com', department: department3, employment_status: 'active', role: 'NON_ADMIN')
employee4 = Employee.create!(name: 'Bob Brown', email: 'bob.brown@example.com', department: department1, employment_status: 'active', role: 'ADMIN')

# Create Expense Reports
expense_report1 = ExpenseReport.create!(employee: employee1, status: 'submitted')
expense_report2 = ExpenseReport.create!(employee: employee2, status: 'approved')
expense_report3 = ExpenseReport.create!(employee: employee3, status: 'rejected')

# Create Expenses
expense1 = Expense.create!(employee: employee1, expense_report: expense_report1, date: '2024-07-01', description: 'Lunch with client', amount: 50.75, invoice_number: 1001, supporting_document: 'invoice1.pdf', status: 'submitted')
expense2 = Expense.create!(employee: employee1, expense_report: expense_report1, date: '2024-07-02', description: 'Office supplies', amount: 30.00, invoice_number: 1002, supporting_document: 'invoice2.pdf', status: 'submitted')
expense3 = Expense.create!(employee: employee2, expense_report: expense_report2, date: '2024-07-01', description: 'Taxi fare', amount: 20.00, invoice_number: 1003, supporting_document: 'invoice3.pdf', status: 'approved')
expense4 = Expense.create!(employee: employee3, expense_report: expense_report3, date: '2024-07-03', description: 'Conference fee', amount: 200.00, invoice_number: 1004, supporting_document: 'invoice4.pdf', status: 'rejected')

# Create Comments
comment1 = Comment.create!(employee: employee1, content: 'Please review this expense.', commentable: expense1)
comment2 = Comment.create!(employee: employee2, content: 'Approved. Good to go.', commentable: expense2)
comment3 = Comment.create!(employee: employee3, content: 'Need more details on this expense.', commentable: expense3)
comment4 = Comment.create!(employee: employee4, content: 'Rejected due to missing invoice.', commentable: expense4)
