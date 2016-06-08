class DocsController < ApplicationController
	# index & show corresponds to Read part of the CRUD
	before_action :find_doc, only: [:show,:edit,:update,:destroy]

	def index
		@docs=Doc.all.order("created_at DESC")
	end

	def show

	end
	#new & create responds to Create part
	def new
		@doc= Doc.new
	end
	#doesnt have a view itself
	def create
		@doc= Doc.new(doc_params)
		if @doc.save
			redirect_to @doc
		else
			rendder 'new'
		end
	end
	# responds to Delete part
	def destory
		
	end
	# edit & update both respond to Update part
	def edit
		
	end
	#doesnt have view either
	def update
		
	end

	private
		def find_doc
			@doc=Doc.find(params[:id])
		end
		def doc_params
			params.require(:doc).permit(:title, :content)
		end


end
