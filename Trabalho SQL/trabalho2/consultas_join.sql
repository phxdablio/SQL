Listar todos os professores de uma determinada cidade
SELECT * FROM criacao_populacao.professor AS P 
INNER JOIN cidade AS C
ON P.idcidade = C.idcidade 
WHERE C.idcidade = 2

Listar todas as disciplinas oferecidas em um determinado campus.
SELECT * FROM turma AS turma 
INNER JOIN campus AS cp 
ON turma.campus_id = cp.campus_id 
WHERE cp.campus_id  = 3

Listar todos os estudantes matriculados em uma turma específica.
SELECT * FROM criacao_populacao.turma_estudante AS Est
INNER JOIN turma AS T
ON Est.idturma = T.idturma
WHERE T.idturma = 3

Listar todas as turmas oferecidas em um determinado campus em um determinado turno
SELECT * FROM turma AS turma
INNER JOIN campus AS campus 
ON turma.campus_id = campus.campus_id
WHERE campus.campus_id = 3
AND turma.turno_id = 3

Listar todos os estudantes que não estão matriculados em nenhuma turma
SELECT * FROM criacao_populacao.turma_estudante AS Est
INNER JOIN turma AS turma
ON Est.idturma = turma.idturma
WHERE turma.idturma = 0

Listar todos os estudantes matriculados em disciplinas ministradas por um professor específico.
SELECT * FROM criacao_populacao.turma AS turma
INNER JOIN turma_estudante AS Te
ON Te.idturma = turma.idturma
WHERE turma.idturma = 5

Listar todas as disciplinas ministradas em um determinado campus em um determinado turno.
SELECT * FROM criacao_populacao.campus AS campus
JOIN turma AS turma
JOIN turno AS turno 
ON turma.idcampus = campus.idcampus
WHERE campus.idcampus = 2
AND turno.idcampus = 3


Listar todas as cidades que têm campus
SELECT * FROM criacao_populacao.cidade AS cidade
JOIN campus AS campus
ON campus.idcidade = cidade.idcidade

Listar todos os estudantes e as turmas em que estão matriculados, incluindo estudantes não matriculados em nenhuma turma.
SELECT idestudante 
FROM turma_estudante
FULL OUTER JOIN turma
ON  turma_estudante.idestudante = turma.idestudante
