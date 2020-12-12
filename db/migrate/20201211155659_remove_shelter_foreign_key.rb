class RemoveShelterForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_reference :applications, :shelter, index: true, foreign_key: true
  end
end
