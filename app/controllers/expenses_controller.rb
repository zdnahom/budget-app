class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses.all
  end

  def new
    @expense = Expense.new
    @categories = current_user.categories.all
    @default_category = params[:category_id]
  end

  def create
    expense = current_user.expenses.new(expense_params)
    if expense.save
      selected_category_ids = params[:expense][:selected_categories].reject(&:empty?)
      selected_category_ids << params[:category_id]

      selected_category_ids.uniq.each do |category_id|
        category = current_user.categories.find(category_id)
        ExpenseCategory.create(expense: expense, category: category)
      end
      redirect_to category_expenses_path, notice: 'Expense created successfully'
    else
      flash.now[:alert] = 'Unable to create an expense'
      render :new
    end
  end

  private

  def expense_params
    permitted_params = params.require(:expense).permit(:name, :amount)
    permitted_params
  end
end
