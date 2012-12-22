module ActiveAdmin
  module Views
    class IndexAsTable
      def authorized_actions(options = {})
        options = {
          :name => ""
        }.merge(options)
        column options[:name] do |resource|
          links = ''.html_safe
          if can? :read, resource
            links << link_to(I18n.t('active_admin.view'),
              resource_path(resource),
              :class => "member_link view_link")
          end
          if can? :update, resource
            links << link_to(I18n.t('active_admin.edit'),
              edit_resource_path(resource),
              :class => "member_link edit_link")
          end
          if can? :destroy, resource
            links << link_to(I18n.t('active_admin.delete'),
              resource_path(resource),
              :method => :delete,
              :data => {:confirm => I18n.t('active_admin.delete_confirmation')},
              :class => "member_link delete_link")
          end
          links
        end
      end
    end
  end
end
