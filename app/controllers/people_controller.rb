class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /people or /people.json
  def index
    @people = Person.all
    # repond with html and json
    respond_to do |format|
      format.html
      format.json { render json: @people }
    end
  end

  # GET /people/1 or /people/1.json
  def show
    @person
  end

  # GET /people/new
  def new
    @person = Person.new
    @person.build_nested_attributes
  end

  # GET /people/1/edit
  def edit
    @person.build_nested_attributes
  end

  # POST /people or /people.json

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: 'Person was successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Person was successfully created.' }
        format.json { render :show, status: :created, person: @person }
      else
        @person.build_nested_attributes

        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@person, partial: 'people/form', locals: { person: @person })
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: 'Person was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Person was successfully updated.' }
        format.json { render :show, status: :ok, person: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
      # THe page doesn't update automatically... maybe this is where those destroy.turbo_stream.erb files come in?
      format.turbo_stream { flash.now[:notice] = 'Person was successfully deleted.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(
      :firstname,
      :middlename,
      :lastname,
      :ssn,
      :birthdate,
      :comment,
      :salutation,
      phones_attributes: %i[id number comment _destroy],
      emails_attributes: %i[id address comment _destroy],
      addresses_attributes: %i[id street town zip state country _destroy]
    )
  end
end
