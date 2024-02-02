ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :roles
    actions
  end

  form do |f|
    f.inputs "" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
  end
end
