require 'spec_helper'
require 'pry'

describe Meetup do
    context "for an auth hash that has the title, details, and tags of an already existing event" do
      let(:meetup) {
        Meetup.create(
          title: "github",
          details: "We love github",
          tags: "git",
        )
      }
      it "should return the existing user" do
        meetup2 = Meetup.find(meetup)
        expect(meetup2).to eq(meetup)
      end
    end
end
