require 'fox16'
include Fox
class Window < FXMainWindow
  def initialize(app)
    super(app, "Students" , :width => 1100, :height => 400)

    tab_book = FXTabBook.new(self, nil, 0, LAYOUT_FILL_X||LAYOUT_FILL_Y)
    # Создаем первую вкладку
    tab1 = FXTabItem.new(tab_book, "Вкладка 1", nil)
    composite1 = FXComposite.new(tab_book, LAYOUT_FILL_X||LAYOUT_FILL_Y)
    @first_tab = FXHorizontalFrame.new(composite1)
    @first_tab.resize(1000,1000)
    @count_page = 3
    first_tab


    # Создаем вторую вкладку
    tab2 = FXTabItem.new(tab_book, "Вкладка 2", nil)
    @composite2 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)

    tab3 = FXTabItem.new(tab_book, "Вкладка 3", nil)
    @composite3 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)

  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end

  private
  def first_tab

    add_filters
    add_table

  end

  def add_filters
    #filter
    @frame_filter = FXVerticalFrame.new(@first_tab)
    @frame_filter.resize(500,300)

    field_filter =[[:git, 'GitHaha'], [:email, 'EMail'], [:phone, 'Phone'], [:telegram, 'Telegrammm']]
    #ФИЛЬТР ИМЕНИ
    nameLabel = FXLabel.new(@frame_filter, "Name")
    nameTextField = FXTextField.new(@frame_filter, 50)
    @filter = {short_name: nameTextField}

    #фильтрация для остальных полей
    field_filter.each do |field|
      @filter[field[0]] = create_radio_group(field, @frame_filter)
    end
  end

  def add_table
    table_frame = FXVerticalFrame.new(@first_tab)
    #отображение страниц
    change_page = FXHorizontalFrame.new(table_frame, :opts=> LAYOUT_CENTER_X)
    btn_back=FXButton.new(change_page, "back", :opts=> BUTTON_INITIAL)
    btn_back.textColor = Fox.FXRGB(0,25,175)
    #добавить отображение со страницы, на которой мы сейчас
    res=Array(1..@count_page).join(',')
    page_label = FXLabel.new(change_page, res)
    btn_next=FXButton.new(change_page, "next", :opts=> BUTTON_INITIAL)
    btn_next.textColor = Fox.FXRGB(0,23,175)


    # Создаем таблицу
    table = FXTable.new(table_frame, :opts =>  TABLE_READONLY|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT|TABLE_COL_SIZABLE|TABLE_ROW_RENUMBER, :width=>580, :height=>320)
    table.setTableSize(10, 3)

    table.setColumnText(0, "ФИО")
    table.setColumnText(1, "Git")
    table.setColumnText(2, "Контакт")


    # Заполняем таблицу данными
    table.setItemText(0, 0, "Johnatan Davis")
    table.setItemText(0, 1, "@JD")
    table.setItemText(0, 2, "Hiv@example.com")

    table.setItemText(1, 0, "Monkey")
    table.setItemText(1, 1, "@Monday")
    table.setItemText(1, 2, "MonSA@example.com")

    table.setItemText(2, 0, "Bob Marley")
    table.setItemText(2, 1, "@bob")
    table.setItemText(2, 2, "bob@example.com")

    table.setItemText(3, 0, "Alice in Chains")
    table.setItemText(3, 1, "@alice_in_chains")
    table.setItemText(3, 2, "aliceinchains@example.com")

    table.setItemText(4, 0, "Michel Jacksob")
    table.setItemText(4, 1, "@mike")
    table.setItemText(4, 2, "Myers@example.com")

    table.setItemText(5, 0, "Sam")
    table.setItemText(5, 1, "@Broooog")
    table.setItemText(5, 2, "HHHHH@example.com")

    table.setItemText(6, 0, "Tom")
    table.setItemText(6, 1, "@tomy")
    table.setItemText(6, 2, "tomyt@example.com")

    table.setItemText(7, 0, "Emily")
    table.setItemText(7, 1, "@MetalKid")
    table.setItemText(7, 2, "longHairs@example.com")

    table.setItemText(8, 0, "Joll")
    table.setItemText(8, 1, "@ja")
    table.setItemText(8, 2, "yyy@example.com")

    table.setItemText(9, 0, "Lucy")
    table.setItemText(9, 1, "@FUHHHH")
    table.setItemText(9, 2, "Lucius@example.com")


    # Масштабируем таблицу
    table.setRowHeaderWidth(50)
    table.setColumnWidth(0, 200)
    table.setColumnWidth(1, 200)
    table.setColumnWidth(2, 200)

    table.getColumnHeader.connect(SEL_COMMAND) do |a, b,col|
      sort_table_by_column(table,0)
    end

    change_page.connect(SEL_COMMAND) do
      table.killSelection
    end
  end

  #сортировка таблицы по столбцу
  def sort_table_by_column(table, column_index)
    #ере
    table_data = (0...table.getNumRows()).map { |row_index| (0...table.getNumColumns()).map { |col_index| table.getItemText(row_index, col_index) } }

    sorted_table_data = table_data.sort_by { |row_data| row_data[column_index] }

    sorted_table_data.each_with_index do |row_data, row_index|
      row_data.each_with_index do |cell_data, col_index|
        table.setItemText(row_index, col_index, cell_data)
      end
    end
  end

  def create_radio_group(field, parent)
    #Фильтрация гита

    frame_field = FXVerticalFrame.new(parent, LAYOUT_FILL_X||LAYOUT_SIDE_TOP)
    label_field = FXLabel.new(frame_field, field[1])

    line_radio = FXHorizontalFrame.new(frame_field, LAYOUT_FILL_X|LAYOUT_SIDE_TOP)
    # Создаем radiobutton
    radio_yes = FXRadioButton.new(line_radio, "Да")
    radio_no = FXRadioButton.new(line_radio, "Нет")
    radio_no_matter = FXRadioButton.new(line_radio, "Не важно")
    #фильтр
    text_field = FXTextField.new(line_radio, 50)

    #прописываем доступность
    text_field.setEnabled(false)
    radio_yes.connect(SEL_COMMAND) do
      radio_no.check=false
      radio_no_matter.check=false

      if radio_yes.checked?
        text_field.setEnabled(true)
      end
    end
    radio_no.connect(SEL_COMMAND) do
      radio_no_matter.check=false
      radio_yes.check=false
      if radio_no.checked?
        text_field.setEnabled(false)
      end
    end
    radio_no_matter.connect(SEL_COMMAND) do
      radio_no.check=false
      radio_yes.check=false
      if radio_no_matter.checked?
        text_field.setEnabled(false)
      end
    end
    frame_field
  end

end

app = FXApp.new
Window.new(app)
app.create
app.run
