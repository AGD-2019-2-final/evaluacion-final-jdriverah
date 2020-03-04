-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
A = LOAD 'data.tsv' USING PigStorage('\t')
    AS (f1:INT, f2:CHARARRAY, f3:MAP[]);
B= FOREACH A GENERATE FLATTEN(f3) AS (f1:CHARARRAY);
c = GROUP B BY f1;
a = FOREACH c GENERATE group, COUNT($1);
STORE a INTO 'output' USING PigStorage (',');
