ActiveAdmin.register Bleat do
  controller.authorize_resource
  
  filter :content
  filter :created_at
  filter :user_email, :as => :string
  filter :user_screen_name, :as => :string
    
  index do
    selectable_column

    column :user
    column :content
    column :created_at
    
    authorized_actions
  end
  
  show do |ad|
    attributes_table do
      row :user
      row :content
      row :created_at
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :content
    end
    f.buttons
  end
end
