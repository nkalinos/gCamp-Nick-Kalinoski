task cleanup: :environment do

  desc "Removes all memberships where their users have already been deleted"
  task remove_deleted_users_memberships: :environment do
    Membership.all.each do |membership|
      if membership.user == nil
        membership.destroy
      end
    end
  end

  desc "Removes all memberships where their projects have already been deleted"
  task remove_deleted_projects_memberships: :environment do
    Membership.all.each do |membership|
      if membership.project == nil
        membership.destroy
      end
    end
  end

  desc "Removes all tasks where their projects have been deleted"
  task remove_deleted_tasks_projects: :environment do
    Tasks.all.each do |task|
      if task.project == nil
        task.destroy
      end
    end
  end

  desc "Removes all comments where their tasks have been deleted"
  task remove_deleted_tasks_comments: :environment do
    Comment.all.each do |comment|
      if comment.task == nil
        comment.destroy
      end
    end
  end

  desc "Sets the user_id of comments to nil if their users have been deleted"
  task set_comments_to_nil_when_user_is_deleted: :environment do
    Comment.all.each do |comment|
      if comment.user_id == nil
          @comment == nil
      end
    end
  end

  desc "Removes any tasks with null project_id"
  task remove_deleted_users_memberships: :environment do
    Membership.all.each do |membership|
      if membership.user == nil
        membership.destroy
      end
    end
  end

  desc "Removes any comments with a null task_id"
  task remove_task_if_no_project: :environment do
    Task.all.each do |task|
      if task.project_id == nil
        task.destroy
      end
    end
  end

  desc "Removes any memberships with a null project_id or user_id"
  task remove_memberships_if_no_project_or_user: :environment do
    Membership.all.each do |membership|
      if membership.project_id.nil? || membership.user_id.nil?
        membership.destroy
      end
    end
  end
end
