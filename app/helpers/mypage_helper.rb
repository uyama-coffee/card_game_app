module MypageHelper
  def new_or_edit_resume_path
    current_user.resume? ? edit_resume_path(current_user.resume) : new_resume_path
  end
end
