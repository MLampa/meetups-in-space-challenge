class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |meetup|
      meetup.string :title, null: false
      meetup.string :details, null: false
      meetup.string :tags, null: false

      meetup.timestamps null: false
    end
  end
end
