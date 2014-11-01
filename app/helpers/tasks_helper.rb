module TasksHelper
  def due_in(task)

    if task.due_date != nil
     due_in = (task.due_date - Date.today).to_int

    else
     due_in = 0.1

    end
  end

  def row_class_for_task(task, due_in)

    if task.due_date != nil && due_in > 0 && due_in <= 7
      "alert alert-warning"

    elsif due_in !=  nil && due_in <= 0
      "alert alert-danger"

    elsif task.due_date != nil && due_in >= 0
      "alert alert-success"

    elsif task.due_date == nil
      "none"
    end
  end

  def link_clickable(string, url)
    uri = URI.parse(request.url)

    if uri.query
      @uri_path = "#{uri.path}?#{uri.query}"
      @query = true
    else
      @uri_path = "#{uri.path}"
      @query = false
    end

    if @uri_path == url
      return string
    else
      return link_to string, url
    end
  end

end
