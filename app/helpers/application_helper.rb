module ApplicationHelper
  def anyone_signed_in?
    student_signed_in? or orange_signed_in?
  end
end
