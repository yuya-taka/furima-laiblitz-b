window.addEventListener('turbo:load', function () {

  const parentCategory = document.getElementById('parent-category')
  // 子カテゴリーの選択フォームのビューを表示
  // 選択フォーム画面を取得
  const selectWrap = document.getElementById('select-wrap')

  const selectChildElement = (selectForm) => {

  }

  // 非同期通信でリクエストを送信
  const XHR = new XMLHttpRequest();
  const categoryXHR = (id) => {
    XHR.open("GET", `/new_category/${id}`, true);
    XHR.responseType = "json";
    XHR.send();
  }

  
  const getChildCategoryData = () => {
    // まずは親カテゴリーの値を取得
    const parentValue = parentCategory.value
    // 子カテゴリーの値を取得するために親カテゴリーと紐付ける
    categoryXHR(parentValue)

    XHR.onload = () => {
      // searchアクション返却したitemは、XHR.response.itemで取得
      const items = XHR.response.item;
      // appendChildSelectで定義した処理を実行し、子カテゴリーの選択フォームを取得
      appendChildSelect(items)
      const childCategory = document.getElementById('child-select')

      // 子カテゴリーのプルダウンの値が変化することによって、
      // 孫カテゴリーの選択フォームが表示されるイベントを定義します。
      childCategory.addEventListener('change', () => {
        selectChildElement('grand-child-select-wrap')
        getGrandchildCategoryData(childCategory)
      })
    }
  }

  // 子カテゴリーの選択フォームのビューを表示
  // (items)を引数としてappendChildSelectという関数を定義
  const appendChildSelect = (items) => {
    // createElementは、HTML要素を生成するメソッド
    const childWrap = document.createElement('div')
    const childSelect = document.createElement('select')
    // 「div要素」に、('id', 'child-select-wrap')を追加
    childWrap.setAttribute('id', 'child-select-wrap')
    childSelect.setAttribute('id', 'child-select')
    childSelect.setAttribute('class', 'select-box')

    items.forEach(item => {
      const childOption = document.createElement('option')
      childOption.innerHTML = item.name
      childOption.setAttribute('value', item.id)
      // createElementメソッドで生成した要素に、HTML要素を追加
      childSelect.appendChild(childOption)
    }); //子カテゴリーの選択フォームを表示することができました

    childWrap.appendChild(childSelect)
    selectWrap.appendChild(childWrap)
  }

  parentCategory.addEventListener('change', function () {
    selectChildElement('child-select-wrap')
    // 最初のセレクトボックスで親カテゴリーを選択した後、理を呼び出します
    getChildCategoryData()
  })

})