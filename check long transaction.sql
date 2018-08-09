## 查詢長交易的狀態(交易超過5秒)
select x.trx_mysql_thread_id as "trx_id" ,x.trx_query as "current_statement" ,z.last_statement ,TIMESTAMPDIFF(SECOND,x.trx_started,now()) as "running" ,x.trx_started 
from information_schema.innodb_trx x join information_schema.processlist y
 on x.trx_mysql_thread_id = y.id join sys.session z
  on y.id = z.conn_id
where TIMESTAMPDIFF(SECOND,x.trx_started,now()) > 5;