-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: olist_ecommerce
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category_translation`
--

DROP TABLE IF EXISTS `category_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translation` (
  `product_category_name` varchar(100) NOT NULL,
  `product_category_name_english` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` varchar(50) NOT NULL,
  `customer_unique_id` varchar(50) DEFAULT NULL,
  `customer_zip_code_prefix` varchar(5) DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL,
  `customer_state` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geolocation`
--

DROP TABLE IF EXISTS `geolocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geolocation` (
  `geolocation_zip_code_prefix` varchar(5) DEFAULT NULL,
  `geolocation_lat` decimal(10,6) DEFAULT NULL,
  `geolocation_lng` decimal(10,6) DEFAULT NULL,
  `geolocation_city` varchar(100) DEFAULT NULL,
  `geolocation_state` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` varchar(50) NOT NULL,
  `order_item_id` int NOT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `seller_id` varchar(50) DEFAULT NULL,
  `shipping_limit_date` datetime DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `freight_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_payments`
--

DROP TABLE IF EXISTS `order_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payments` (
  `order_id` varchar(50) DEFAULT NULL,
  `payment_sequential` int DEFAULT NULL,
  `payment_type` varchar(30) DEFAULT NULL,
  `payment_installments` int DEFAULT NULL,
  `payment_value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_reviews`
--

DROP TABLE IF EXISTS `order_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_reviews` (
  `review_id` varchar(50) NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `review_score` int DEFAULT NULL,
  `review_comment_title` varchar(250) DEFAULT NULL,
  `review_comment_message` text,
  `review_creation_date` datetime DEFAULT NULL,
  `review_answer_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_reviews_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `order_purchase_timestamp` datetime DEFAULT NULL,
  `order_approved_at` datetime DEFAULT NULL,
  `order_delivered_carrier_date` datetime DEFAULT NULL,
  `order_delivered_customer_date` datetime DEFAULT NULL,
  `order_estimated_delivery_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` varchar(50) NOT NULL,
  `product_category_name` varchar(100) DEFAULT NULL,
  `product_name_length` int DEFAULT NULL,
  `product_description_length` int DEFAULT NULL,
  `product_photos_qty` int DEFAULT NULL,
  `product_weight_g` int DEFAULT NULL,
  `product_length_cm` int DEFAULT NULL,
  `product_height_cm` int DEFAULT NULL,
  `product_width_cm` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `seller_id` varchar(50) NOT NULL,
  `seller_zip_code_prefix` varchar(5) DEFAULT NULL,
  `seller_city` varchar(100) DEFAULT NULL,
  `seller_state` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_category_revenue`
--

DROP TABLE IF EXISTS `vw_category_revenue`;
/*!50001 DROP VIEW IF EXISTS `vw_category_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_category_revenue` AS SELECT 
 1 AS `category`,
 1 AS `total_revenue`,
 1 AS `total_orders`,
 1 AS `revenue_rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_order_counts`
--

DROP TABLE IF EXISTS `vw_customer_order_counts`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_order_counts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_order_counts` AS SELECT 
 1 AS `customer_unique_id`,
 1 AS `order_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monthly_revenue`
--

DROP TABLE IF EXISTS `vw_monthly_revenue`;
/*!50001 DROP VIEW IF EXISTS `vw_monthly_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monthly_revenue` AS SELECT 
 1 AS `month`,
 1 AS `total_revenue`,
 1 AS `prev_month_revenue`,
 1 AS `mom_growth_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_repeat_customer_rate`
--

DROP TABLE IF EXISTS `vw_repeat_customer_rate`;
/*!50001 DROP VIEW IF EXISTS `vw_repeat_customer_rate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_repeat_customer_rate` AS SELECT 
 1 AS `repeat_customers`,
 1 AS `total_customers`,
 1 AS `repeat_rate_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_seller_performance`
--

DROP TABLE IF EXISTS `vw_seller_performance`;
/*!50001 DROP VIEW IF EXISTS `vw_seller_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_seller_performance` AS SELECT 
 1 AS `seller_id`,
 1 AS `seller_state`,
 1 AS `seller_city`,
 1 AS `total_sales`,
 1 AS `total_orders`,
 1 AS `state_rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_category_revenue`
--

/*!50001 DROP VIEW IF EXISTS `vw_category_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_category_revenue` AS with `category_sales` as (select `ct`.`product_category_name_english` AS `category`,round(sum(`oi`.`price`),2) AS `total_revenue`,count(distinct `oi`.`order_id`) AS `total_orders` from ((`order_items` `oi` join `products` `p` on((`oi`.`product_id` = `p`.`product_id`))) join `category_translation` `ct` on((`p`.`product_category_name` = `ct`.`product_category_name`))) group by `ct`.`product_category_name_english`) select `category_sales`.`category` AS `category`,`category_sales`.`total_revenue` AS `total_revenue`,`category_sales`.`total_orders` AS `total_orders`,rank() OVER (ORDER BY `category_sales`.`total_revenue` desc )  AS `revenue_rank` from `category_sales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_order_counts`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_order_counts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_order_counts` AS select `c`.`customer_unique_id` AS `customer_unique_id`,count(distinct `o`.`order_id`) AS `order_count` from (`customers` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) where (`o`.`order_status` = 'delivered') group by `c`.`customer_unique_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monthly_revenue`
--

/*!50001 DROP VIEW IF EXISTS `vw_monthly_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monthly_revenue` AS with `monthly_sales` as (select date_format(`o`.`order_purchase_timestamp`,'%Y-%m-01') AS `month`,round(sum((`oi`.`price` + `oi`.`freight_value`)),2) AS `total_revenue` from (`orders` `o` join `order_items` `oi` on((`o`.`order_id` = `oi`.`order_id`))) where (`o`.`order_status` = 'delivered') group by date_format(`o`.`order_purchase_timestamp`,'%Y-%m-01')) select `monthly_sales`.`month` AS `month`,`monthly_sales`.`total_revenue` AS `total_revenue`,lag(`monthly_sales`.`total_revenue`) OVER (ORDER BY `monthly_sales`.`month` )  AS `prev_month_revenue`,round((((`monthly_sales`.`total_revenue` - lag(`monthly_sales`.`total_revenue`) OVER (ORDER BY `monthly_sales`.`month` ) ) / lag(`monthly_sales`.`total_revenue`) OVER (ORDER BY `monthly_sales`.`month` ) ) * 100),2) AS `mom_growth_pct` from `monthly_sales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_repeat_customer_rate`
--

/*!50001 DROP VIEW IF EXISTS `vw_repeat_customer_rate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_repeat_customer_rate` AS select count((case when (`vw_customer_order_counts`.`order_count` > 1) then 1 end)) AS `repeat_customers`,count(0) AS `total_customers`,round(((count((case when (`vw_customer_order_counts`.`order_count` > 1) then 1 end)) / count(0)) * 100),2) AS `repeat_rate_pct` from `vw_customer_order_counts` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_seller_performance`
--

/*!50001 DROP VIEW IF EXISTS `vw_seller_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_seller_performance` AS with `seller_sales` as (select `s`.`seller_id` AS `seller_id`,`s`.`seller_state` AS `seller_state`,`s`.`seller_city` AS `seller_city`,round(sum(`oi`.`price`),2) AS `total_sales`,count(distinct `oi`.`order_id`) AS `total_orders` from (`order_items` `oi` join `sellers` `s` on((`oi`.`seller_id` = `s`.`seller_id`))) group by `s`.`seller_id`,`s`.`seller_state`,`s`.`seller_city`) select `seller_sales`.`seller_id` AS `seller_id`,`seller_sales`.`seller_state` AS `seller_state`,`seller_sales`.`seller_city` AS `seller_city`,`seller_sales`.`total_sales` AS `total_sales`,`seller_sales`.`total_orders` AS `total_orders`,rank() OVER (PARTITION BY `seller_sales`.`seller_state` ORDER BY `seller_sales`.`total_sales` desc )  AS `state_rank` from `seller_sales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-13 22:29:57
