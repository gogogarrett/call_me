defmodule CallMeWeb.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:event) do
      add :canonical_student_id, :integer
      add :grade_position, :integer
      add :grade_name, :string
      add :class_id, :integer
      add :school_id, :integer
      add :district_id, :integer
      add :parent_id, :integer
      add :product, :string
      add :precinct, :string
      add :event_type, :string
      add :lesson, :integer
      add :activity, :integer
      add :quiz, :integer
      add :score, :integer
      add :passed, :boolean, default: false, null: false
      add :event_details, :map
      add :assignment, :boolean, default: false, null: false
      add :grid, :string
      add :column, :integer
      add :row, :integer
      add :correct_count, :integer
      add :total_count, :integer

      timestamps()
    end

  end
end
