
<?php
include "../connect.php";
include '../functions.php';
$categoriesid =filterRequest("id");
$userid =filterRequest("userid");
// وخلي قيمتها ب1favoriteالهدف منها  هاتلي كل العناصر الا مضافه في  
// وخلي قيمتها بي  0favoriteوهاتلي كل العناصر الا مش مضافه في 
$stmt =$con->prepare("SELECT item1view.*,1 AS favorite ,( item_price - ( item_price*item_discount/ 100)) AS itemprice_discount FROM item1view
INNER JOIN favorite ON favorite.favorite_itemsid =item1view.item_id AND favorite.favorite_userid=$userid
WHERE categories_id =$categoriesid
UNION ALL 
SELECT *,0 AS favorite ,( item_price -( item_price*item_discount/ 100)) AS itemprice_discount    FROM item1view
WHERE    categories_id =$categoriesid AND item_id NOT IN(SELECT item1view.item_id FROM item1view
INNER JOIN favorite ON favorite.favorite_itemsid =item1view.item_id AND favorite.favorite_userid=$userid)");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ( $count >0) {
    echo json_encode(array("status" => "success", "data" => $data));
}else {
    echo json_encode(array("status" => "failer",));
}

