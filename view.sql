CREATE OR REPLACE VIEW item1view AS 
SELECT items.* ,categories.* FROM items
INNER JOIN categories on items.item_categories= categories.categories_id

//
SELECT item1view.* FROM item1view
INNER JOIN favorite ON favorite.favorite_itemsid =item1view.item_id AND favorite.favorite_userid=100

//
  وخلي قيمتها ب1favoriteالهدف منها  هاتلي كل العناصر الا مضافه في  
  وخلي قيمتها بي  0favoriteوهاتلي كل العناصر الا مش مضافه في 
SELECT item1view.*,1 AS favorite FROM item1view
INNER JOIN favorite ON favorite.favorite_itemsid =item1view.item_id AND favorite.favorite_userid=$userid
WHERE categories_id =$categoriesid
UNION ALL 
SELECT *,0 AS favorite FROM item1view
WHERE      categories_id =$categoriesid AND item_id NOT IN(SELECT item1view.item_id FROM item1view
INNER JOIN favorite ON favorite.favorite_itemsid =item1view.item_id AND favorite.favorite_userid=$userid)

//

//  لازم نكون بينهم علاقهitemsوجدول favoriteمهم جدا  سيضع كل عناصر بتاعت جدول
CREATE OR REPLACE VIEW myfavorite AS
// معني هذا السطر بينشا صفحه وهميه فيها الربط بين جدولين

SELECT favorite.* ,items.* ,user.user_id FROM favorite
// وuser.user_id itemsوfavoriteهاتلي من جدول 
INNER JOIN user ON user.user_id =favorite.favorite_userid
// الا خاصه بهfavoriteله userوهنا نكتب العلاقات بين الجداول لانه كل 
INNER JOIN items ON items.item_id =favorite.favorite_itemsid

//
CREATE OR REPLACE VIEW cartview AS
SELECT SUM(items.item_price) as items_prices  ,   COUNT(cart.cart_itemid)as countitems,   cart.*,items.* FROM cart 

INNER JOIN items ON items.item_id=cart.cart_itemid
GROUP BY cart.cart_itemid ,cart.cart_userid

/////
SELECT SUM(items_prices) as TotalPrice , COUNT(countitems)as Totalcount  FROM `cartview` 
 WHERE cartview.cart_userid=106 
GROUP BY cart_userid
/////////////
كيف تنشاColumn جديد
CREATE OR REPLACE VIEW cartview AS
SELECT SUM(items.item_price) as items_prices  ,  ( item_price  - ( item_price*item_discount/ 100)) AS itemprice_discount , COUNT(cart.cart_itemid)as countitems,   cart.*,items.* FROM cart 
INNER JOIN items ON items.item_id=cart.cart_itemid

WHERE cart_orders= 0
GROUP BY cart.cart_itemid ,cart.cart_userid


INNER JOIN items ON items.item_id=cart.cart_itemid



CREATE OR REPLACE VIEW `item1view` AS
SELECT ( item_price  - ( item_price*item_discount/ 100)) AS itemprice_discount ,  items.* FROM items 

//كيف تنشاColumn جديد
//مع يعمل استدعاء لجميع categoriesوitemsو

CREATE OR REPLACE VIEW item1view AS 
SELECT items.* ,categories.*,item_price  - ( item_price*item_discount/ 100) AS itemprice_discount FROM items
INNER JOIN categories on items.item_categories= categories.categories_id
