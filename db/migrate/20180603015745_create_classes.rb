class CreateClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :classes do |t|
      t.references :subject, foreign_key: true
      t.references :professor, foreign_key: true

      t.timestamps
    end
  end
end
