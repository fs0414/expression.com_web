class SentencesController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    if params[:search].present?
      @sentences = Sentence.where('content LIKE ?', "%#{params[:search]}%")
    else
      @sentences = Sentence.all
    end


  end

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = current_user.sentences.new(sentence_params)

    if @sentence.save
      redirect_to root_path, notice: '文章を投稿しました'
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @sentence = Sentence.find(params[:id])
    @sentence.destroy
    redirect_to root_path, notice: '文章を削除しました'
  end

  private

  def sentence_params
    params.require(:sentence).permit(:content)
  end
end
