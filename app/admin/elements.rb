ActiveAdmin.register Element do
  scope_to unless: proc{ current_user.fullname == "Chris Dalla Santa" } do
    current_user.site
  end
  config.sort_order = 'name_asc'

  permit_params :name,
    :setup_element_instructions, :setup_equipment_instructions, :setup_environment_instructions,
    :takedown_element_instructions, :takedown_equipment_instructions, :takedown_environment_instructions,
    :periodic_element_instructions, :periodic_equipment_instructions, :periodic_environment_instructions

  index do
    selectable_column
    column :name
    actions
  end

  filter :name

  form do |f|
    tabs do
      tab 'Basic' do
        f.inputs do
          f.input :name
        end
      end

      tab 'Setup' do
        f.inputs do
          f.input :setup_equipment_instructions, label: "Equipment"
          f.input :setup_element_instructions, label: "Element"
          f.input :setup_environment_instructions, label: "Environment"
        end
      end

      tab 'Takedown' do
        f.inputs do
          f.input :takedown_equipment_instructions, label: "Equipment"
          f.input :takedown_element_instructions, label: "Element"
          f.input :takedown_environment_instructions, label: "Environment"
        end
      end

      tab 'Periodic' do
        f.inputs do
          f.input :periodic_equipment_instructions, label: "Equipment"
          f.input :periodic_element_instructions, label: "Element"
          f.input :periodic_environment_instructions, label: "Environment"
        end
      end
    end

    f.actions
  end

  show title: :fullname do
    attributes_table do
      row('Name'){ |r| r.fullname }
      row :email
      row :role
    end
  end
end
