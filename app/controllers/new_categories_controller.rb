class NewCategoriesController < ApplicationController
  # JavaScriptからのリクエストを、コントローラーで受け取り、JSON形式としてレスポンスを返します
  def search
    # 該当するレコードを取得しitemに代入
    item = NewCategory.find(params[:id])
    # childrenメソッドを使用することで、子カテゴリーの要素を取得
    children_item = item.children
    # JSON形式のレスポンスをnew_category.jsへ返します
    render json:{ item: children_item }
  end
end
