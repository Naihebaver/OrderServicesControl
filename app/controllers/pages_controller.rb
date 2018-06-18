class PagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  skip_before_action :verify_authenticity_token

  def index
  end

  def search_order
  end

  def order_status
  	@code = params[:code]
	@phone = params[:phone]
	if @code.empty?
		flash[:danger] = "Введіть номер накладної!"
		render 'search_order'

	elsif @code.size !=11 and @code.size !=14
		flash[:danger] = "Номер накладної повинен складатися з 11 або 14 символів!"
		render 'search_order'

	else
		HistoryRequest.create(user_id: current_user.id, invoice_number: @code, phone_number: @phone) 

		agent = Mechanize.new
		url = "https://novaposhta.ua/tracking"
		page = agent.get(url)

		form = page.form_with(:class => "track")
		
		form['cargo_number'] = @code
		form['phone'] = @phone
		second_page = agent.submit(form)
		count = second_page.search('div.response p').count
	
		@result1 = second_page.search('div.response p')[0].text
		@result2 = second_page.search('div.response p')[1].text

		if count == 5
			@result3 = second_page.search('div.response p')[2].text
			@result4 = second_page.search('div.response p')[3].text
			@result5 = second_page.search('div.response p')[4].text
		elsif count ==6	
			@result3 = second_page.search('div.response p')[2].text
			@result4 = second_page.search('div.response p')[3].text
			@result5 = second_page.search('div.response p')[4].text
			@result6 = second_page.search('div.response p')[5].text
		end
	end


  end
end
