-- 1. JOIN — Mostrar apenas alunos inscritos com os nomes das disciplinas
select aluno.nome, disciplina.nome_disciplina
from inscricao
join aluno on inscricao.id_aluno = aluno.id_aluno
join disciplina on inscricao.id_disciplina = disciplina.id_disciplina;

-- 2. LEFT JOIN — Mostrar todos os alunos, mesmo os não inscritos
SELECT aluno.nome, disciplina.nome_disciplina
FROM aluno
LEFT JOIN inscricao ON aluno.id_aluno = inscricao.id_aluno
LEFT JOIN disciplina ON inscricao.id_disciplina = disciplina.id_disciplina;

-- 3. RIGHT JOIN — Mostrar todas as disciplinas, mesmo sem alunos
SELECT disciplina.nome_disciplina, aluno.nome
FROM aluno
RIGHT JOIN inscricao ON aluno.id_aluno = inscricao.id_aluno
RIGHT JOIN disciplina ON inscricao.id_disciplina = disciplina.id_disciplina;

 -- 4. LEFT JOIN — Listar nome de cada aluno e sua matrícula (se houver) 
SELECT aluno.nome, inscricao.id_inscricao
FROM aluno
LEFT JOIN inscricao ON aluno.id_aluno = inscricao.id_aluno;

-- 5. INNER JOIN — Mostrar apenas as disciplinas com alunos inscritos
SELECT disciplina.nome_disciplina, aluno.nome
FROM disciplina
JOIN inscricao ON disciplina.id_disciplina = inscricao.id_disciplina
JOIN aluno ON inscricao.id_aluno = aluno.id_aluno;

-- 6. RIGHT JOIN — Mostrar disciplinas e os nomes de alunos inscritos
SELECT disciplina.nome_disciplina, aluno.nome
FROM aluno
RIGHT JOIN inscricao ON aluno.id_aluno = inscricao.id_aluno
RIGHT JOIN disciplina ON inscricao.id_disciplina = disciplina.id_disciplina;

-- 7. LEFT JOIN com filtro — Mostrar apenas os alunos sem inscrição
SELECT aluno.nome
FROM aluno
LEFT JOIN inscricao ON aluno.id_aluno = inscricao.id_aluno
WHERE inscricao.id_inscricao IS NULL;

-- 8. LEFT JOIN com contagem — Total de disciplinas por aluno
SELECT aluno.nome, COUNT(inscricao.id_disciplina) AS total_disciplinas
FROM aluno
LEFT JOIN inscricao ON aluno.id_aluno = inscricao.id_aluno
GROUP BY aluno.nome;