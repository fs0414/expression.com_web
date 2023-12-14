class OtherSentencesController < ApplicationController
  before_action :set_sentence, only: [:new, :create, :destroy]
  def new
    @other_sentence = OtherSentence.new
  end

  def create
    @other_sentence = @sentence.other_sentences.build(other_sentence_params)
    @other_sentence[:user_id] = current_user.id

    if @other_sentence.save
      redirect_to root_path, notice: 'あなたの表現を投稿しました'
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @other_sentence = @sentence.other_sentences.find(params[:id])
    @other_sentence.destroy
    redirect_to sentences_path, notice: 'あなたの表現を削除しました'
  end

  private

  def set_sentence
    @sentence = Sentence.find(params[:sentence_id])
  end

  def other_sentence_params
    params.require(:other_sentence).permit(:content)
  end
end
