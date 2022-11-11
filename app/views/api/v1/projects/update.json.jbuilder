json.data do
  json.project do
    json.call(
      @project,
      :id,
      :name,
      :created_at,
      :updated_at
    )
  end
end
