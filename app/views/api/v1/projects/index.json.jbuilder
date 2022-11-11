json.data do
  json.projects do
    json.call(
      @projects,
      :id,
      :name,
      :created_at,
      :updated_at
    )
  end
end
