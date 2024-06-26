create default def1 as getdate();  
sp_bindefault def1, 'olist_order.order_purchase_timestamp' 
-------
create proc Olist_order_insert
@customerID tinyint, 
@orderStatus varchar(20),
@purchase_time_stamp timestamp,  
@order_approved_at time, 
@order_delivered_carrier_date date,
@order_delivered_customer_date date,
@order_delivered_estimated_date date
as 
begin
insert into olist_orders values 
(@customerID, 
@orderStatus,
@purchase_time_stamp,  
@order_approved_at , 
@order_delivered_carrier_date,
@order_delivered_customer_date,
@order_delivered_estimated_date)
End


create proc Order_Detail_Update (@productid, @order_ID smallint, @ord_item )
as
update olist_order_items
set product_id = @productid 
where orderid = @order_ID and order_item_id = @ord_item 

  
create nonclustered index category_index
on olist_products(product_category_name_english)

  
alter table olist_order_items add constraint c1  check(price>0)

  
create rule r1 as @x>=1 and @x<=5
sp_bindrule r1, 'olist_order_reviews.review_score'

