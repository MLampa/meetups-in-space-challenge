# require 'spec_helper'
#
# feature "User sees others who have registered for the meetup" do
#   let(:user) do
#     Meetup.create(
#       title: "Cheese Making",
#       details: "We love dairy ... and manipulating it... to make cheese. We love cheese.",
#       tags: "dairy"
#       )
#   end
#
#   let(:user) do
#     Membership.create(
#       meetup_id: 1,
#       user_id: 1
#       )
#   end
#
#   scenario "sees other meetup registrants" do
#     visit '/'
#     click_link "Cheese Making"
#
#     expect(page).to have_content "MLampa"
#   end
# end
