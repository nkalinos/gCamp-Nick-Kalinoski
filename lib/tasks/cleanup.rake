task cleanup: [:environment] do

  Membership.all.each do |f|

    if f.user_id.nil? or f.project_id.nil?
      f.destroy
  end

  Comment.where(task_id: nil).destroy_all

  Task.where(project_id: nil).destroy_all

end

end
