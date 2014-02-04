require 'jebediah'
require 'json'
require 'sinatra'
require 'sinatra/contrib'

class JebediahServer < Sinatra::Base
	register Sinatra::Contrib
	set :static, true
	set :public_folder, File.dirname(__FILE__) + '/static'

	get '/' do
		erb :index
	end

	get '/*', :provides => [:html, :json] do
		terms = params[:splat][0].split("/")
		translated = Jebediah.new.process(terms)

		if translated[:type] == 'error' then
			respond_with :error, "error" do |f|
				f.json { JSON.generate({ :phrase => 'error', :hash => 'error' }) }
			end
			return
		end

		if translated[:type] == 'phrase' then
			@result = { :phrase => translated[:result], :hash => terms[0] }
		elsif translated[:type] == 'hash' then
			@result = { :phrase => terms, :hash => translated[:result] }
		end

		respond_with :result, "result" do |f|
			f.json { JSON.generate(@result)}
		end
	end
end
