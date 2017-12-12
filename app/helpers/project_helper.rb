module ProjectHelper
  #Shop/projectのフォームでNewかEditかを判定しパスを渡す
  def choose_new_or_edit
    if action_name == 'new'
      shop_projects_path
    elsif action_name == 'edit'
      shop_project_path
    end
  end
end
