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

      it "fails because birthdate in the future" do
        expect(Person.new({first_name: "Juan",
                           last_name: "Perez",
                           email:'my_email@email.com',
                           job: 'Engineer',
                           bio: 'blah',
                           birthdate: '2017-08-11'}).save).to be false
      end
    end

    describe "date validations" do
      it "saves a person" do
        expect(Person.new({first_name: "Juan",
                           last_name: "Perez",
                           email:'my_email@email.com',
                           job: 'Engineer',
                           bio: 'blah',
                           birthdate: '1988-08-11'}).save).to be true
      end
    end
  end
end


