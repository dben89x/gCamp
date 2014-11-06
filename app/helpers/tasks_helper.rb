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

  def link_clickable(string, param_path, unique)
    uri = URI.parse(request.url)
    @uri_params = URI.parse(param_path)

    if @uri_params.query
      @uri1 = "#{@uri_params.path}?#{@uri_params.query}"
    else
      @uri2 = "#{@uri_params.path}"
    end


    if uri.query{"filter"}
      @uri = "#{@uri_params.path}?#{@uri_params.query}"
      @query = true
    else
      @uri = "#{@uri_params.path}"
      @query = false
    end

    if @uri == param_path
      return string
    else
      return link_to string, param_path
    end
  end

end
