# require 'spec_helper'
#
# feature "User creates new meetup" do
#   let(:user) do
#     Meetup.create(
#       title: "Cheese Making",
#       details: "We love dairy ... and manipulating it... to make cheese. We love cheese.",
#       tags: "dairy"
#       )
#   end
#
#   scenario "successful meetup creation" do
#     visit '/'
#     click_link "Submit"
#     expect(page).to have_content "Cheese Making"
#   end
# end
