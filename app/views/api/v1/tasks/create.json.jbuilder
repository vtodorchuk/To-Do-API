json.data do
  json.task do
    json.call(
      @task,
      :id,
      :title,
      :completed,
      :position,
      :created_at,
      :updated_at
    )
  end
end
