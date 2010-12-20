module ApplicationHelper

  def item_actions(object)
    role = current_user ? current_user.role.name.underscore : "client"
    class_name = object.class.name.underscore
    render "/#{class_name.pluralize}/#{role}_actions_#{class_name}", class_name.to_sym => object rescue nil
  end

  def collection_actions(collection_name)
    role = current_user ? current_user.role.name.underscore : "client"
    name = collection_name.to_s.underscore
    render "/#{name}/#{role}_actions_#{name}" rescue nil
  end

  def navigation
    role = current_user ? current_user.role.name.underscore : "client"
    render "/common/#{role}_navigation"
  end

  def errors_for(object)
    render "common/error_messages", :object => object if object and object.errors.any?
  end

  def format_price(price)
    price
  end

  def format_flag(flag)
    raw "<span class=\"flag #{flag}\"></span>"
  end

  def format_date(date)
    return format_flag(false) unless date
    date.strftime("%d.%m.%Y")
  end

  def link_to_email(email)
    link_to email, "mailto:#{email}"
  end

  def nav(link)
    raw "<div class=\"element\"><span>#{link}</span></div>"
  end

  def link_back_to(destination)
    method_name = "#{destination.to_s}_path"
    link_to t("common.go_back"), send(method_name.to_sym), :class => "action back with_text"
  end

  def link_to_back

  end

  def link_to_add(model)
    model_name = model.to_s.underscore
    method_name = "new_#{model_name}_path"
    text = t "#{model_name.pluralize}.new"
    link_to text, send(method_name), :class => "action add with_text"
  end

  def link_to_edit(object)
    model_name = object.class.name.underscore
    method_name = "edit_#{model_name}_path"
    text = t "common.edit"
    link_to text, send(method_name, object), :class => "action edit"
  end

  def link_to_show(object)
    model_name = object.class.name.underscore
    method_name = "#{model_name}_path"
    text = t "common.show"
    link_to_unless_current text, send(method_name, object), :class => "action show" do
      #dummy
    end
  end

  def link_to_remove(object, options = {})
    options[:unless] ||= false
    options[:if] ||= !options[:unless]
    model_name = object.class.name.underscore
    method_name = "#{model_name}_path"
    text = t "common.show"
    if options[:if]
      link_to text, send(method_name, object), :confirm => t("common.are_you_sure"), :method => :delete, :class => "action delete"
    else
      dummy_link(text, "action delete")
    end
  end

  def dummy_link(text, clazz)
    raw "<span class=\"#{clazz} disabled\">#{text}</span>"
  end

  def link_to_remove_fields(f)
    f.hidden_field(:_destroy) + link_to_function(t("common.delete"), "remove_fields(this)", :class => "action delete with_text")
  end

  def link_to_add_fields(association, f)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    text = t "#{f.object.class.name.underscore.pluralize}.add_#{association.to_s.singularize.to_s}"
    link_to_function(text, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class => "action add with_text")
  end
end

