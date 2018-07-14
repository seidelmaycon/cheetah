defmodule Github do
  @access_token ""
  @owner ""
  @repository ""

  def client do
    Tentacat.Client.new(%{access_token: @access_token})
  end

  def pull_requests do
    Tentacat.Pulls.list(client(), @owner, @repository)
  end

  def pending_pulls do
    {_code, data, _response} = pull_requests()

    data
    |> Enum.map(fn pr -> if pull_request_waiting_for_review?(pr), do: pr end)
  end

  def requested_reviewers(pr) do
    pr["requested_reviewers"]
    |> Enum.map(fn reviewer -> reviewer["login"] end)
  end

  def pull_request_waiting_for_review?(pr) do
    pr["labels"]
    |> Enum.any?(fn label -> if ready_for_review?(label), do: label end)
  end

  def ready_for_review?(label) do
    label["name"] == "ready-for-review"
  end
end
