module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end


  def my_warehouses
    Warehouse.all
  end

  def latest_orders
    Order.limit(3)
  end

  def progress_bar_status(val)
    class_name = if val > Warehouse::DANGER_SIZE
      'progress-bar-danger'
    elsif val > Warehouse::WARNING_SIZE
      'progress-bar-warning'
    elsif val > Warehouse::SAFE_SIZE 
      'progress-bar-info'
    else
      'progress-bar-success'
    end 
  end
end
