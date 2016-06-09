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
		@doc= current_user.docs.build
	end
	#doesnt have a view itself
	def create
		@doc= current_user.docs.build(doc_params)
		if @doc.save
			redirect_to @doc
		else
			rendder 'new'
		end
	end
	# responds to Delete part
	def destory
		@doc.destory
		redirect_to 'index'
	end
	# edit & update both respond to Update part
	def edit
		
	end
	#doesnt have view either
	def update
		if @doc.update(doc_params)
			redirect_to @doc
		else
			render 'edit'
		end
	end

	private
		def find_doc
			@doc=Doc.find(params[:id])
		end
		def doc_params
			params.require(:doc).permit(:title, :content)
		end


end
