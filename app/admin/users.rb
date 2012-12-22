ActiveAdmin.register User do
  controller.authorize_resource
  
  filter :email
  filter :screen_name
  filter :created_at
    
  index do
    selectable_column

    column :email
    column :screen_name
    column :created_at
    column :last_sign_in_at
    
    default_actions
  end
  
  show do |ad|
    attributes_table do
      row :email
      row :screen_name
      row :created_at
      row :last_sign_in_at
      row :bio
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :screen_name
      f.input :bio
    end
    f.buttons
  end
end
