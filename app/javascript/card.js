const pay = () => {
  const payjp = Payjp('sk_test_2688513c0dda39e086c8ecfe')// PAY.JPテスト公開鍵
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベント発火")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);