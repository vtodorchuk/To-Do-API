json.data do
  json.task do
    json.call(
      @comment,
      :id,
      :body,
      :created_at,
      :updated_at
    )
  end
end
