class PersonsController < ApplicationController

  # GET /persons
  # GET /persons.json
  def index
    @persons = Person.all

    render json: @person, each_serializer: PersonSerializer, root: false
  end

  # GET /persons/1
  # GET /persons/1.json
  def show
    render json: @person
  end

  # POST /persons
  # POST /persons.json
  def create
    @person = Person.new(person_params)
    if @person.save
      render json: @person, serializer: PersonSerializer, root: false,  status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /persons/1
  # PATCH/PUT /persons/1.json
  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      head :no_content
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /persons/1
  # DELETE /persons/1.json
  def destroy
    @person.destroy

    head :no_content
  end

  private

    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :job, :bio, :gender, :birthdate, :picture)
    end
end

