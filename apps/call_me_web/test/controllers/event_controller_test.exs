defmodule CallMeWeb.EventControllerTest do
  use CallMeWeb.ConnCase

  alias CallMeWeb.Event
  @valid_attrs %{activity: 42, assignment: true, canonical_student_id: 42, class_id: 42, column: 42, correct_count: 42, district_id: 42, event_details: %{}, event_type: "some content", grade_name: "some content", grade_position: 42, grid: "some content", lesson: 42, parent_id: 42, passed: true, precinct: "some content", product: "some content", quiz: 42, row: 42, school_id: 42, score: 42, total_count: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, event_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = get conn, event_path(conn, :show, event)
    assert json_response(conn, 200)["data"] == %{"id" => event.id,
      "canonical_student_id" => event.canonical_student_id,
      "grade_position" => event.grade_position,
      "grade_name" => event.grade_name,
      "class_id" => event.class_id,
      "school_id" => event.school_id,
      "district_id" => event.district_id,
      "parent_id" => event.parent_id,
      "product" => event.product,
      "precinct" => event.precinct,
      "event_type" => event.event_type,
      "lesson" => event.lesson,
      "activity" => event.activity,
      "quiz" => event.quiz,
      "score" => event.score,
      "passed" => event.passed,
      "event_details" => event.event_details,
      "assignment" => event.assignment,
      "grid" => event.grid,
      "column" => event.column,
      "row" => event.row,
      "correct_count" => event.correct_count,
      "total_count" => event.total_count}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, event_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, event_path(conn, :create), event: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Event, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, event_path(conn, :create), event: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = put conn, event_path(conn, :update, event), event: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Event, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = put conn, event_path(conn, :update, event), event: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = delete conn, event_path(conn, :delete, event)
    assert response(conn, 204)
    refute Repo.get(Event, event.id)
  end
end
