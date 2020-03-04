-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

A = LOAD 'data.tsv' USING PigStorage('\t')
    AS (f1:CHARARRAY, f2:BAG{Tuple()}, f3:MAP[CHARARRAY]);
b= FOREACH A GENERATE (f1,f2) AS b1,FLATTEN(f3);
c = GROUP b BY b1;
z = FOREACH c GENERATE group, COUNT($1);
o =FOREACH z GENERATE FLATTEN($0) AS (a1,a2),$1 AS o1;
r =FOREACH o GENERATE (a1,o1,a2) AS r1, a2 AS r2;
l= FOREACH r Generate r1,FLATTEN(r2) AS (l1,l2);
E= GROUP l BY $0;
F = FOREACH E GENERATE group, COUNT($1);
k =FOREACH F GENERATE FLATTEN($0) AS (k1:CHARARRAY,k2:INT,k3:BAG{}),$1 AS k4;
S= FOREACH k GENERATE k1,k4,k2;
k4;FOREACH F GENERATE FLATTEN($0) AS (k1:CHARARRAY,k2:INT,k3:BAG{}),$1 AS 
S= FOREACH k GENERATE k1,k4,k2;
N= ORDER S BY $0, $1, $2;

STORE N INTO 'output' USING PigStorage (',');

