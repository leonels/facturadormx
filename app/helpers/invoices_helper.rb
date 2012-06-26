module InvoicesHelper
  def link_to_remove_fields_invoice(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields_invoice(this)", :class => "delete")
  end

  def link_to_add_fields_invoice(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    # needed to remove the h call or javascript would be printed on the page
    # link_to_function(name, h("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
    # the one below is the good one, I just had to customize it to accomodate it to the table
    link_to_function(name, "add_fields_invoice(this, '#{association}', '#{escape_javascript(fields)}')")
    # link_to_function(name, "add_fields(test, '#{association}', '#{escape_javascript(fields)}')")
  end
end
