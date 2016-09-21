require 'rails_helper'

feature "Viewing Questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 5) }

  let!(:question1) { FactoryGirl.create(:question, title: "Bananas" * 40) }
  let!(:question2) { FactoryGirl.create(:question, title: "Meow" * 40) }
  let!(:question3) { FactoryGirl.create(:question, title: "WOAHWEEE" * 40) }

  context "As a User" do
    context "I can visit the questions page" do

      scenario "And see the title of each question" do
        visit '/'

        questions.each do |q|
          expect(page).to have_content(q.title)
        end
      end

      xscenario "And see the questions listed in order" do
        visit '/'

        expect(page).to have_content("1. #{question1}")
        expect(page).to have_content("2. #{question2}")
        expect(page).to have_content("3. #{question3}")
      end

    end
  end
end



# require 'rails_helper'
#
# feature "Viewing Meetups" do
#   let!(:first_meetup) { create :meetup, name: "AAA"}
#   let!(:first_meetup) { create :meetup, name: "ABA"}
#   let!(:first_meetup) { create :meetup, name: "ACA"}
#   let!(:meetups) { Meetup.all }
#   context "As a User" do
#     context "I can visit the meetups page" do
#       before { visit meetups_path }
#
#       scenario "And see the name for each meetup" do
#         meetups.each do |m|
#           expct(page).to have_content m.name
#       end
#
#       scenario "and see an alphabetized list of meetups" do
#
#         pending
#       end
#     end
#   end
# end
#rspec --format doc
