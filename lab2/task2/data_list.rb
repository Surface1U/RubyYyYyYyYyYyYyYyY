require_relative 'data_table'

class DataList
  
  private_class_method :new
  attr_writer :obj_list
  
  def initialize(obj_list)
    self.obj_list=obj_list
    self.selected_items=[]
  end

  #elements with number
  def select(*numbers)
    selected_items.append(*numbers)
  end

  #ID_array
  def get_select
    obj_list[selected_items].id
  end

  def get_names; end

  #Get table
  # Template
  def get_data
    index_id=0
    dt = obj_list.inject([]) do |res, object|
      row=[index_id]
      row.append(*get_fields(object))
      index_id+=1
      res<<row
    end
    DataTable.new(dt)
  end
  protected
  attr_reader :obj_list
  attr_accessor :selected_items
  def get_fields(object)
    []
  end
end
