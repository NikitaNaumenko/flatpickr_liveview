defimpl Phoenix.Param, for: Date do
  def to_param(%Date{} = d), do: to_string(d)
end
