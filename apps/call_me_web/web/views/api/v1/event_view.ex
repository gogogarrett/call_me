defmodule CallMeWeb.Api.V1.EventView do
  use CallMeWeb.Web, :view

  def render("index.json", %{event: event}) do
    %{data: render_many(event, CallMeWeb.Api.V1.EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, CallMeWeb.Api.V1.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      canonical_student_id: event.canonical_student_id,
      grade_position: event.grade_position,
      grade_name: event.grade_name,
      class_id: event.class_id,
      school_id: event.school_id,
      district_id: event.district_id,
      parent_id: event.parent_id,
      product: event.product,
      precinct: event.precinct,
      event_type: event.event_type,
      lesson: event.lesson,
      activity: event.activity,
      quiz: event.quiz,
      score: event.score,
      passed: event.passed,
      event_details: event.event_details,
      assignment: event.assignment,
      grid: event.grid,
      column: event.column,
      row: event.row,
      correct_count: event.correct_count,
      total_count: event.total_count}
  end
end
