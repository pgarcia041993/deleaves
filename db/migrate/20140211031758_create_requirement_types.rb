class CreateRequirementTypes < ActiveRecord::Migration
  def up
    create_table :requirement_types do |t|
      t.string :name

      t.timestamps
    end

    RequirementType.create!(name: 'Passport')
    RequirementType.create!(name: 'Transcript of Records')
    RequirementType.create!(name: 'Recommendation Form')
  end

  def down
    drop_table :requirement_types
  end
end
