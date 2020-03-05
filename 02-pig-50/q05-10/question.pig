-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
A = LOAD 'data.tsv' USING PigStorage('\t')
    AS (f1:CHARARRAY, f2:BAG{t:(p:CHARARRAY)}, f3:CHARARRAY);
B= FOREACH A GENERATE FLATTEN(f2) AS (f1:CHARARRAY);
DUMP B;
c = GROUP B BY f1;

a = FOREACH c GENERATE group, COUNT($1);
DUMP a;

STORE a INTO 'output'; 

