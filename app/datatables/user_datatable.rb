class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :link_to, :heroicon, :edit_user_path, :user_path

  def view_columns
    @view_columns ||= {
      email: { source: 'User.email' },
      employee: { source: 'Role.employee' },
      admin: { source: 'Role.admin' },
      edit: { source: '', searchable: false, orderable: false },
      destroy: { source: '', searchable: false, orderable: false }
    }
  end

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def data
    records.map do |record|
      {
        email: record.email,
        employee: record.employee ? 'Yes' : 'No',
        admin: record.admin ? 'Yes' : 'No',
        edit: link_to(
          heroicon('pencil', variant: :outline,
                             options: { class: 'hover:text-indigo-700 hover:cursor-pointer h-4' }),
          edit_user_path(record.user_id)
        ),
        destroy: link_to(
          heroicon('trash', variant: :outline,
                            options: { class: 'hover:text-indigo-700 hover:cursor-pointer h-4' }),
          user_path(record.user_id),
          method: :delete, data: { confirm: 'Are you sure you want to proceed?' }
        )
      }
    end
  end

  def get_raw_records
    User.joins(:role).select("users.id AS user_id, roles.id AS roles_id,
      users.email AS email, roles.employee AS employee, roles.admin AS admin")
  end
end
