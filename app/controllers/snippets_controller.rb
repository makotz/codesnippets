class SnippetsController < ApplicationController

  def home
  end

  def new
    @snippet = Snippet.new
    code_types
  end

  def create
    @snippet = Snippet.new snippet_params
    if @snippet.save
      redirect_to snippet_path(@snippet)
    else
      redirect_to new_snippet_path
    end
  end

  def show
    @snippet = Snippet.find params[:id]
    @highlightme = @snippet.work
    @kind = @snippet.code_type.to_sym
  end

  def index
    @rubysnippets = Snippet.where(code_type: "ruby")
    @JSsnippets = Snippet.where(code_type: "javascript")
    @CSSsnippets = Snippet.where(code_type: "css")
    @HTMLsnippets = Snippet.where(code_type: "html")
    @MarkDownsnippets = Snippet.where(code_type: "markdown")
  end

  def code_type
    @type = params[:code_type_id]
    @snippets = Snippet.where(code_type: @type)
  end


  private

  def snippet_params
    params.require(:snippet).permit(:code_type, :title, :work)
  end

  def code_types
    @code_types = ["ruby", "javascript", "html", "css", "markdown"]
  end

end
