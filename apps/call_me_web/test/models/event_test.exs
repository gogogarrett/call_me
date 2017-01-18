defmodule CallMeWeb.EventTest do
  use CallMeWeb.ModelCase

  alias CallMeWeb.Event

  @valid_attrs %{activity: 42, assignment: true, canonical_student_id: 42, class_id: 42, column: 42, correct_count: 42, district_id: 42, event_details: %{}, event_type: "some content", grade_name: "some content", grade_position: 42, grid: "some content", lesson: 42, parent_id: 42, passed: true, precinct: "some content", product: "some content", quiz: 42, row: 42, school_id: 42, score: 42, total_count: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
