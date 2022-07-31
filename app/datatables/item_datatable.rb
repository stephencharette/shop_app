class ItemDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :link_to, :heroicon, :edit_item_path, :item_path, :brand_path

  def view_columns
    @view_columns ||= {
      name: { source: 'Item.name' },
      brand: { source: 'Brand.name' },
      price: { source: 'Item.price' },
      quantity: { source: 'Item.quantity' },
      active: { source: 'Item.active' },
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
        name: record.name,
        brand: link_to(record.brand_name, brand_path(record.brand_id)),
        price: record.price,
        quantity: record.quantity,
        active: record.active ? 'Yes' : 'No',
        edit: link_to(
          heroicon('pencil', variant: :outline,
                             options: { class: 'hover:text-indigo-700 hover:cursor-pointer h-4' }), edit_item_path(record.item_id)
        ),
        destroy: link_to(
          heroicon('trash', variant: :outline,
                            options: { class: 'hover:text-indigo-700 hover:cursor-pointer h-4' }), item_path(record.item_id), method: :delete
        )
      }
    end
  end

  def get_raw_records
    Item.joins(:brand).select('items.id AS item_id, brands.id AS brand_id, items.name AS name, brands.name AS brand_name, items.price AS price, items.quantity AS quantity, items.active AS active')
  end
end
