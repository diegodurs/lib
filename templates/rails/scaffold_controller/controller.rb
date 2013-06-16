<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  respond_to :html

  expose(:<%=singular_table_name%>)
  expose(:<%=plural_table_name%>)

  def index
    respond_with(@<%= plural_table_name %>)
  end

  def show
    respond_with(@<%= singular_table_name %>)
  end

  def new
    respond_with(@<%= singular_table_name %>)
  end

  def edit
    respond_with(@<%= singular_table_name %>)
  end

  def create
    if <%= orm_instance.save %>
      flash[:notice] = "<%= human_name %> successfully created."
    end
    respond_with(<%= singular_table_name %>)
  end

  def update
    if <%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
      flash[:notice] = "<%= human_name %> successfully created."
    end
    respond_with(<%= singular_table_name %>)
  end

  def destroy
    <%= orm_instance.destroy %>
    respond_with(<%= singular_table_name %>)
  end
end
<% end -%>