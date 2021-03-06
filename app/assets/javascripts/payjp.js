document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_8b19e6d584c39442cbc7bca8"); //ここに公開鍵を直書き
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
      btn.addEventListener("click", e => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        var year = document.getElementById("_expiration_date_1i").value
        year = Number(year) + 2000;
        let credit_card = {
          number: document.getElementById("credit_card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("_expiration_date_2i").value,
          exp_year: year
        }; //入力されたデータを取得します。
        Payjp.createToken(credit_card, (status, response) => {
          if (status === 200) { //成功した場合
            $("#credit_card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#_expiration_date_2i").removeAttr("name");
            $("#_expiration_date_1i").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#credit_card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            document.inputForm.submit();
            alert("登録が完了しました");
          } else {
            alert("カード情報が正しくありません。");
          }
        });
      });
    }
  },
  false
);