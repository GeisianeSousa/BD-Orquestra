--listar local e data de todos os concertos regidos pelo maestro Gilberto

SELECT A.local, A.data
FROM APRESENTACAO A, PESSOA P
WHERE P.nome = 'Gilberto' AND P.cpf = A.cpf_maestro;

--Listar local, data, hora e endereço das apresentações realizadas em MG

SELECT A.local, A.data, A.hora
FROM Apresentacao A, Local L
WHERE A.local = L.nome_local AND L.endereco LIKE '%MG%';

--Listar todos os músicos que não tocaram no Salão de Eventos Musicais de Minas Gerais

SELECT P.nome, P.sobrenome
FROM PESSOA P, MUSICO M
WHERE M.cpf_musico = P.cpf
EXCEPT
( SELECT P.nome, P.sobrenome
  FROM PESSOA P, Musico_Toca_Apresentacao MT
  WHERE MT.cpf_musico = P.cpf AND MT.local = 'Salão de Eventos Musicais de Minas Gerais'
);


--Listar os nomes e os salários dos membros femininos da orquestra

SELECT P.nome, P.sobrenome, M.salario
FROM PESSOA P, MEMBRO M
WHERE P.cpf = M.cpf_membro AND P.sexo = 'F';

--listar nome do musico, instrumento e valor dos instrumentos acima de 10 mil reais

SELECT P.nome, P.sobrenome, I.nome, I.valor
FROM PESSOA P, INSTRUMENTO I, MUSICO M
WHERE P.cpf = M.cpf_musico AND M.id_instrumento = I.id_inst AND I.valor > 10000;


-- listar o nome de todos os músicos que tocam instrumentos de cordaS, que tocaram em mais de 
-- 40 concertos, junto de seus instrumentos

SELECT P.nome, P.sobrenome, I.nome, M.concertos_tocados
FROM PESSOA P, MUSICO M, INSTRUMENTO I
WHERE  P.cpf = M.cpf_musico AND M.id_instrumento = I.id_inst 
AND I.familia = 'Cordas' AND M.concertos_tocados > 40;


HJAGLASLJHGASF
