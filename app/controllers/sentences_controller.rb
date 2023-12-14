class SentencesController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @sentences = Sentence.all
  end

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = current_user.sentences.new(sentence_params)

    if @sentence.save
      redirect_to root_path, notice: 'Sentence was successfully created.'
    else
      render :new
    end
  end

  private

  def sentence_params
    params.require(:sentence).permit(:content)
  end
end
