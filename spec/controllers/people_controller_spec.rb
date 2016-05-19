require 'rails_helper'

describe PeopleController do

  describe "GET index" do
    it "assigns @people" do
      person = Person.create({first_name: "Juan",
                         last_name: "Perez",
                         email:'my_email@email.com',
                         job: 'Engineer',
                         bio: 'blah',
                         birthdate: '1988-08-11'})
      get :index
      expect(assigns(:people)).to eq([person])
    end

    it "renders json" do
      person = Person.create({first_name: "Juan",
                         last_name: "Perez",
                         email:'my_email@email.com',
                         job: 'Engineer',
                         bio: 'blah',
                         birthdate: '1988-08-11'})
      get :index, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(1)
    end
  end

  describe "GET show" do
    it "assigns @person" do
      person = Person.create({first_name: "Juan",
                         last_name: "Perez",
                         email:'my_email@email.com',
                         job: 'Engineer',
                         bio: 'blah',
                         birthdate: '1988-08-11'})
      get :show, id: person.id
      expect(assigns(:person)).to eq(person)
    end

    it "renders json" do
      person = Person.create({first_name: "Juan",
                         last_name: "Perez",
                         email:'my_email@email.com',
                         job: 'Engineer',
                         bio: 'blah',
                         birthdate: '1988-08-11'})
      get :show, id: person.id, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response['first_name']).to eq(person.first_name)
    end
  end

  describe "POST create" do
    context "when params are correct" do
      it "creeates a new person" do
        post :create, {person: {first_name: "Juan",
                                last_name: "Perez",
                                email:'my_email@email.com',
                                job: 'Engineer',
                                bio: 'blah',
                                birthdate: '1988-08-11'}}
        expect(response).to be_success
      end
    end

    context "when params are not correct" do
      it "does not creates a new person" do
        post :create, { person: { first_name: "Juan",
                                  last_name: "Perez",
                                  email:'my_email@email.com',
                                  job: 'Engineer',
                                  bio: 'blah',
                                  birthdate: '2017-08-11' } }
        expect(response).to_not be_success
        expect(Person.all.length).to eq(0)
      end
    end

    it "renders json" do
      post :create, { person: { first_name: "Juan",
                                last_name: "Perez",
                                email:'my_email@email.com',
                                job: 'Engineer',
                                bio: 'blah',
                                birthdate: '1988-08-11' } }
      json_response = JSON.parse(response.body)
      expect(Person.all.length).to eq(1)
    end

    it "sends an email" do
      expect(LoginMailJob).to receive(:perform_later)
      post :create, { person: { first_name: "Juan",
                                last_name: "Perez",
                                email:'my_email@email.com',
                                job: 'Engineer',
                                bio: 'blah',
                                birthdate: '1988-08-11' } }
    end
  end

  describe "DELETE destroy" do
    it "deletes a person" do
      person = Person.create({first_name: "Juan",
                         last_name: "Perez",
                         email:'my_email@email.com',
                         job: 'Engineer',
                         bio: 'blah',
                         birthdate: '1988-08-11'})
      delete :destroy, id: person.id
      expect(Person.all.length).to eq(0)
    end

    it "sends an email" do
      expect(SignOffMailJob).to receive(:perform_now)
      person = Person.create({first_name: "Juan",
                         last_name: "Perez",
                         email:'my_email@email.com',
                         job: 'Engineer',
                         bio: 'blah',
                         birthdate: '1988-08-11'})
      delete :destroy, id: person.id
    end
  end
end

