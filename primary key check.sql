--查詢哪些資料表沒有primary key
select x.table_schema ,x.table_name ,x.table_type
from information_schema.tables x left join (select table_schema ,table_name
											from information_schema.columns
											where column_key = 'PRI') y
 on x.table_schema = y.table_schema
  and x.table_name = y.table_name
where y.table_name is null
 and x.table_schema not in ('information_schema' ,'mysql' ,'performance_schema' ,'sys') ;
 
--查詢primary key各種data type總數
select table_schema ,data_type ,count(table_name) 'count_type'
from information_schema.columns
where table_schema not in ('information_schema' ,'mysql' ,'performance_schema' ,'sys')
 and column_key = 'PRI'
group by table_schema ,data_type;

--依照primary key的data type進行查詢
select table_schema ,table_name ,data_type
from information_schema.columns
where table_schema = 'db_name' 
 and data_type = 'data_type'
 and column_key = 'PRI';