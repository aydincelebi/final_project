ActiveAdmin.register JobApplication do
  permit_params :name, :description, :company_id, :interest_level, :platform,
                :networking, :comments, :applied_on, :heard_back_on, :user_id, :job_type_id, :url

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
