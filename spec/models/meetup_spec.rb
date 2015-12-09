require 'spec_helper'
require 'pry'

describe Meetup do
    context "page has the title, details, and tags of an already existing event" do
      let(:meetup) {
        Meetup.create(
          title: "github",
          details: "We love github",
          tags: "git"
        )
      }
      it "should return the information of the existing title, details, and tags" do
        meetup2 = Meetup.where(title: meetup.title)
        expect(meetup2[0]).to eq(meetup)
      end
    end
end
