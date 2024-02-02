# frozen_string_literal: true

ActiveAdmin.register Article do
  permit_params :title, :body, :user_id

  index do
    selectable_column
    column :id
    column :title
    column :body do |body|
      body.body.truncate(100)
    end
    column :user
    column :slug
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Article Details" do
      f.input :title
      f.input :body
      f.input :user, heading: false,allow_destroy: true, new_record: false do |a|
        a.input :user
      end
    end
    f.actions
  end
end
