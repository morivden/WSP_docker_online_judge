// ajaxを使ってソースコードをアップロード
function runCode() {
  $('#run_button').text('実行中').prop('disabled', true);

  var language = $('#language').val();
  var source_code = aceEditor.getValue();
  var input1 = $('#input1').val();

  $.ajax({
    // '/api/run'にデータを投げる設定
    url: '/api/run',
    method: 'POST',
    data: {
      language: language,
      source_code: source_code,
      input1: input1
    }
  }).done(function(result) {
    // サーバ側で実行終了したときの結果の反映
    $('#stdout').text(result.stdout);
    $('#stderr').text(result.stderr);
    $('#time').text(result.time);
    $('#exit_code').text(result.exit_code);
    $('#run_button').text('実行(Ctrl-Enter)').prop('disabled', false);
  }).fail(function(err) {
    // サーバ側で実行がコケた時のエラーハンドリング
    alert('Request Failed: ' + err);
    $('#run_button').text('実行(Ctrl-Enter)').prop('disabled', false);
  });
}

