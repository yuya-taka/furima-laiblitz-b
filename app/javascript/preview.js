document.addEventListener('turbo:load', function(){
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('item-image');

  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');

  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!postForm) return null;
  console.log("preview.jsが読み込まれました");

   // input要素を取得
   const fileField = document.querySelector('input[type="file"][name="item[image]"]');
   // input要素で値の変化が起きた際に呼び出される関数
   fileField.addEventListener('change', function(e){
    // 古いプレビューが存在する場合は削除
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
    alreadyPreview.remove();
    };
   console.log("input要素で値の変化が起きました");
   console.log(e.target.files[0]);
   
   const file = e.target.files[0];
   const blob = window.URL.createObjectURL(file);

   // 画像を表示するためのdiv要素を生成
   const previewWrapper = document.createElement('div');
   previewWrapper.setAttribute('class', 'preview');
   
   // 表示する画像を生成
   const previewImage = document.createElement('img');
   previewImage.setAttribute('class', 'preview-image');
   previewImage.setAttribute('src', blob);

  // 削除ボタンを生成
  const deleteButton = document.createElement("div");
  deleteButton.setAttribute("class", "image-delete-button");
  deleteButton.innerText = "削除";   

  // 削除ボタンをクリックしたらプレビューを削除する
  deleteButton.addEventListener("click", () => {
  previewWrapper.remove();
  // ファイルフィールドの値をクリア
  fileField.value = "";
  });


   // 生成したHTMLの要素をブラウザに表示させる
   previewWrapper.appendChild(previewImage);
   previewWrapper.appendChild(deleteButton);   
   previewList.appendChild(previewWrapper);
   });
});