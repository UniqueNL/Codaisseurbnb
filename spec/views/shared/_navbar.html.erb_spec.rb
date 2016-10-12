require 'rails_helper'

describe "shared/_navbar.html.erb" do
  context "for signed in users" do
    before { sign_in user }

    context "without profile" do
      let(:user) { create :user }

      it "renders email" do
        render
        expect(rendered).to have_content user.email
      end
    end

    context "with profile" do
      let(:profile) { create :profile }
      let(:user) { create :user, profile: profile }

      it "renders full name" do
        render
        expect(rendered).to have_content profile.first_name
        expect(rendered).to have_content profile.last_name
      end
    end

  end

  context "for anonymous users" do

    context "check logged in" do

      it "render sign up and login" do
        render
        expect(rendered).to have_content("Log In")
        expect(rendered).to have_content("Sign Up")
      end
    end
  end

end