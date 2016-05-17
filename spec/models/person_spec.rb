require 'rails_helper'

describe Person do
  context "Validations" do

    describe "format validations" do

    end

    describe "presence validations" do

      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }

      it "fails because no birthdate" do
        expect(Person.new({first_name: "Juan", last_name: "Perez", email:'my_email@email.com', job: 'Engineer', bio: 'blah'}).save).to be false
      end

    end
  end
end


