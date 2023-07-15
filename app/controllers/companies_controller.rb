class CompaniesController < AppController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @people = @company.people
  end

  def new
    @company = Company.new
    @people = Person.all
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      render turbo_stream: [
        turbo_stream.prepend(:list, partial: 'companies/company', locals: { company: @company })
      ]
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
    @people = Person.all
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company
    else
      render :edit
    end
  end


  private

  def company_params
    params.require(:company).permit(:name, person_ids: [])
  end
end