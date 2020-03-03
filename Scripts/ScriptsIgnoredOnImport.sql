
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"Order"') and o.name = 'FK_ORDER_REFERENCE_CUSTOMER')
alter table "Order"
   drop constraint FK_ORDER_REFERENCE_CUSTOMER
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrderItem') and o.name = 'FK_ORDERITE_REFERENCE_ORDER')
alter table OrderItem
   drop constraint FK_ORDERITE_REFERENCE_ORDER
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrderItem') and o.name = 'FK_ORDERITE_REFERENCE_PRODUCT')
alter table OrderItem
   drop constraint FK_ORDERITE_REFERENCE_PRODUCT
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Product') and o.name = 'FK_PRODUCT_REFERENCE_SUPPLIER')
alter table Product
   drop constraint FK_PRODUCT_REFERENCE_SUPPLIER
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('Customer')
            and   name  = 'IndexCustomerName'
            and   indid > 0
            and   indid < 255)
   drop index Customer.IndexCustomerName
GO

if exists (select 1
            from  sysobjects
           where  id = object_id('Customer')
            and   type = 'U')
   drop table Customer
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('"Order"')
            and   name  = 'IndexOrderOrderDate'
            and   indid > 0
            and   indid < 255)
   drop index "Order".IndexOrderOrderDate
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('"Order"')
            and   name  = 'IndexOrderCustomerId'
            and   indid > 0
            and   indid < 255)
   drop index "Order".IndexOrderCustomerId
GO

if exists (select 1
            from  sysobjects
           where  id = object_id('"Order"')
            and   type = 'U')
   drop table "Order"
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('OrderItem')
            and   name  = 'IndexOrderItemProductId'
            and   indid > 0
            and   indid < 255)
   drop index OrderItem.IndexOrderItemProductId
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('OrderItem')
            and   name  = 'IndexOrderItemOrderId'
            and   indid > 0
            and   indid < 255)
   drop index OrderItem.IndexOrderItemOrderId
GO

if exists (select 1
            from  sysobjects
           where  id = object_id('OrderItem')
            and   type = 'U')
   drop table OrderItem
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('Product')
            and   name  = 'IndexProductName'
            and   indid > 0
            and   indid < 255)
   drop index Product.IndexProductName
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('Product')
            and   name  = 'IndexProductSupplierId'
            and   indid > 0
            and   indid < 255)
   drop index Product.IndexProductSupplierId
GO

if exists (select 1
            from  sysobjects
           where  id = object_id('Product')
            and   type = 'U')
   drop table Product
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('Supplier')
            and   name  = 'IndexSupplierCountry'
            and   indid > 0
            and   indid < 255)
   drop index Supplier.IndexSupplierCountry
GO

if exists (select 1
            from  sysindexes
           where  id    = object_id('Supplier')
            and   name  = 'IndexSupplierName'
            and   indid > 0
            and   indid < 255)
   drop index Supplier.IndexSupplierName
GO

if exists (select 1
            from  sysobjects
           where  id = object_id('Supplier')
            and   type = 'U')
   drop table Supplier
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usercountry]
	-- Add the parameters for the stored procedure here
 @country varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from customer where country = @country
 
END
GO


