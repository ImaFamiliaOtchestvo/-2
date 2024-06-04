<?
include($_SERVER['DOCUMENT_ROOT']."./Config.php");
include($_SERVER['DOCUMENT_ROOT']."./Дипломный сайт версия 2.html");
if(isset($_GET['param']) && $_GET["param"]=="done")
{

/////////////////// Изменить
   $d = $conn->prepare("select * from requst where id =:id");
  $d ->execute(["id"=>$_GET["id"]]);
  $m = $d->fetch(PDO::FETCH_ASSOC);
    $dbh = $conn->prepare("update requst set status=:status where id=:id");
    $dbh->execute(["id"=>$_GET['id'],"status"=>$_POST["status"]]);
    header("Location: /galeryimg");
}
//////////////// удалить
if(isset($_GET['param']) && $_GET["param"]=="delete")
{

 
  $db = $conn->prepare("delete from requst where id = :id");
  $db->execute(["id"=>$_GET["id"]]);
  
  header("Location: /galeryimg");
}
/////////////// форма редактирования
if(isset($_GET['id'])){

  
 
    $dbh = $conn->prepare("SELECT * FROM requst WHERE id=:id");
    $dbh->execute(["id"=>$_GET['id']]);
    $dba = $conn->prepare("SELECT * FROM `users-data`");
    $m = $dbh->fetch(PDO::FETCH_ASSOC);
  
  ?><div class="container">
  <form method="POST" action="done" enctype="multipart/form-data">
  
  <div class="mb-3">
  <h1>Редактор строк</h1>

  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">name</label>
    <input name="name" class="form-control" id="exampleInputPassword1" value="<? echo $m['name'];?>">
    <br>
    <label for="exampleInputPassword1" class="form-label">text</label>
    <input name="text" class="form-control" id="exampleInputPassword1" value="<? echo $m['text'];?>">
    <br>
    <label for="exampleInputPassword1" class="form-label">status</label>
    <input name="text" class="form-control" id="exampleInputPassword1" value="<? echo $m['status'];?>">
  <br>
  <button type="submit" class="btn btn-primary" >Отправить</button>
  <button type="Button" class="btn btn-primary" ><a href="/reqedit" style="color: white;">Назад</a></button>
  <br>
  </form> </div><?;
  }

else{
?>



<div class="container">
<br>
<?
echo'<table class="table" id="tbody">
<thead><tr>
    <th scope="col" class="number title-item">#</th>
    <th scope="col" class="number title-item">Загаловок заявки</th>
    <th scope="col" class="email title-item">Содержимое заявки</th>
    <th scope="col" class="email title-item">Статус</th>
    ';
//     <th scope="col" class="email title-item">Первая картинка</th>

  ?>
    <th scope="col"></th>
</tr></thead> <tbody>
<?

if(isset($_COOKIE['login'])){
    $dbh = $conn->prepare("SELECT * FROM `requst` where user = :login");
    $user = $_COOKIE['login']; 
    $dbh->execute(["login" => $user]);
    $m = $dbh->fetchAll(PDO::FETCH_ASSOC);
    $ind = 0;
 foreach($m  as $key =>$val){
 $ind++;
 echo "<tr data-id=".$m[$key]['id'].">";
 echo "<td>".$ind."</td>";
 echo "<td>".$m[$key]['name']."</td>";
 echo "<td>".$m[$key]['text']."</td>";
 echo "<td>".$m[$key]['status']."</td>";
 echo '<td><div class="task-item_buttons">
 <button type="BUTTON" data-action="done" class="btn btn-primary">
 Edit </button> <button type="BUTTON" data-action="delete" class="btn btn-danger">
 delete </button></div>';
 
 


 };
echo '</tbody>';
echo '</table>';
}
?>
</div>

<script>
    let zz = document.querySelector('.table');
    zz.addEventListener('click',function(e){
        if (e.target.tagName =='BUTTON'){
            if(e.target.dataset.action == "done") {
            window.location = "reqedit/"+e.target.closest("tr").dataset.id+"/";  
            //+e.target.parentElement.parentElement.parentElement.children[0].innerHtml;
            
          }  
        }
    }  );
    </script>
    <script>
    let as = document.querySelector('.table');
    as.addEventListener('click',function(e){
        if (e.target.tagName =='BUTTON'){
            if(e.target.dataset.action == "delete") {
            window.location = "reqedit/"+e.target.closest("tr").dataset.id+"/delete";  
            //+e.target.parentElement.parentElement.parentElement.children[0].innerHtml;
            
          }  
        }
    }  );
    </script>


<?
}
$conn = null;

echo "<br>";
?>