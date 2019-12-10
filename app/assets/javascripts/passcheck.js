$(function() {
  var password  = '#user_password';
    // パスワードの入力画面のクラスをpasswardに入れる
  var passcheck = '.signup-form__label__check-box__input';
    // チェックボックスのクラスをpasscheck
  $(passcheck).change(function() {
    //   passcheckの中身が変更された際、イベント発火
      if ($(this).prop('checked')) {
        //   チェックが入ったら
          $(password).attr('type','text');
        //   passwordをテキストに変換
      } else {
          $(password).attr('type','password');
        //   チェックが入っていないときはパスワードのまま
      }
  });
});


