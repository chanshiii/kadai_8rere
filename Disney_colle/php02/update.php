<?php
// エラーを出力する デプロイした時にどこにエラ〜が起きたか確認できる 注意としてはコードの一番上に記載する必要がある。
ini_set( 'display_errors', 1 );

//１．入力チェック(受信確認処理追加)
//年数名受信チェック
if(!isset($_POST["year"]) || $_POST["year"]==""){
  exit("ParamError:year");
}
//入手場所受信チェック
if(!isset($_POST["place"]) || $_POST["place"]==""){
  exit("ParamError:place");
}
//カテゴリ受信チェック
if(!isset($_POST["category"]) || $_POST["category"]==""){
  exit("ParamError:category");
}
//画像受信チェック
if(!isset($_FILES["img"]["name"]) || $_FILES["img"]["name"]==""){
  exit("ParamError:img");
}
//内容受信チェック
if(!isset($_POST["naiyou"]) || $_POST["naiyou"]==""){
  exit("ParamError:naiyou");
}


//2. POSTデータ取得
//$name = filter_input( INPUT_GET, ","name" ); //こういうのもあるよ
//$email = filter_input( INPUT_POST, "email" ); //こういうのもあるよ
// test
$id      =$_POST["id"];  //formをpostでしているのでGETだと受け取ることができない
$year    =$_POST["year"];
$place   =$_POST["place"];
$category=$_POST["category"];
$img     =$_FILES["img"]["name"];
$naiyou  =$_POST["naiyou"];
// $var_dump($_FILES);

//3. fileupload処理
$upload ="./img/"; //画像アップロードのパス
// アップロードしたアップっロードした画像を./img/へ移動
if(move_uploaded_file($_FILES['img']['tmp_name'], $upload.$img)){
//FileUpload OK
}else{
//FileUpload NG
  echo "Upload failed";
  echo $_FILES['img']['error'];
}

//4. DB接続します
include ("funcs.php");
$pdo= db_conn();

//5．データ登録SQL作成 :nameとかバインド変数 bindValue:橋渡ししてくれる関数 改ざんされるのを防止する
// UPDATEの時は以下のような書き方に変更する必要がある。さらにVALUESでなくSETにし、WHEREでidを指定する必要がある。
$sql = "UPDATE disney_colle SET year=:year, place=:place, category=:category, img=:img, naiyou=:naiyou WHERE id=:id";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':year',    $year,    PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':place',   $place,   PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':category',$category,PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':img',     $img,     PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':naiyou',  $naiyou,  PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':id',      $id,      PDO::PARAM_INT);  //Integer（数値の場合 PDO::PARAM_INT)
$status = $stmt->execute(); //execute():実行　True falseが返ってくる

//6．データ登録処理後
if($status==false){
  //SQL実行時にエラーがある場合（エラーオブジェクト取得して表示）
  sql_error($stmt);
}else{
  //５．index.phpへリダイレクト
  redirect("select.php"); //Location:コロンの後はスペースが必須、スペースの後にphp名
}
?>
