-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

A = LOAD 'data.tsv' USING PigStorage('\t')
    AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);
b = FOREACH A GENERATE f3;
c = ORDER b BY f3;
z = LIMIT c 5;

STORE z INTO 'output';


