defmodule CallMeWeb.Event do
  use CallMeWeb.Web, :model

  schema "event" do
    field :canonical_student_id, :integer
    field :grade_position, :integer
    field :grade_name, :string
    field :class_id, :integer
    field :school_id, :integer
    field :district_id, :integer
    field :parent_id, :integer
    field :product, :string
    field :precinct, :string
    field :event_type, :string
    field :lesson, :integer
    field :activity, :integer
    field :quiz, :integer
    field :score, :integer
    field :passed, :boolean, default: false
    field :event_details, :map
    field :assignment, :boolean, default: false
    field :grid, :string
    field :column, :integer
    field :row, :integer
    field :correct_count, :integer
    field :total_count, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:canonical_student_id, :grade_position, :grade_name, :class_id, :school_id, :district_id, :parent_id, :product, :precinct, :event_type, :lesson, :activity, :quiz, :score, :passed, :event_details, :assignment, :grid, :column, :row, :correct_count, :total_count])
    |> validate_required([:canonical_student_id, :grade_position, :grade_name, :class_id, :school_id, :district_id, :parent_id, :product, :precinct, :event_type, :lesson, :activity, :quiz, :score, :passed, :event_details, :assignment, :grid, :column, :row, :correct_count, :total_count])
  end
end
