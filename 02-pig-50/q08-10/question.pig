-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
A = LOAD 'data.tsv' USING PigStorage('\t')
    AS (f1:CHARARRAY, f2:BAG{Tuple()}, f3:MAP[CHARARRAY]);
B= FOREACH A GENERATE FLATTEN(f2) AS a1, f3 AS a2;
C= FOREACH B GENERATE a1 AS b2, FLATTEN(a2);
D= FOREACH C GENERATE (b2,$1) AS c1; 
E= GROUP D BY c1;
F= FOREACH E GENERATE group, COUNT($1);

STORE F INTO 'output';
