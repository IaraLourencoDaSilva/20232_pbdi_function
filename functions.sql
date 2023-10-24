--Exercicios
-- 1.1 Escreva a seguinte função
-- nome: fn_consultar_saldo
-- recebe: código de cliente, código de conta
-- devolve: o saldo da conta especificada

CREATE OR REPLACE FUNCTION fn_consultar_saldo(
	IN cod_cliente INT,
	IN cod_cod_conta INT
) RETURNS NUMERIC(10,2) LANGUAGE plpgsql AS $$
DECLARE 
	v_saldo NUMERIC(10,2);
BEGIN
	 SELECT saldo INTO v_saldo
    FROM tb_conta c
    WHERE c.cod_cliente = p_cod_cliente AND c.cod_conta = p_cod_conta;
    RETURN v_saldo;
EXCEPTION WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
$$


-- DO $$
-- DECLARE
-- v_cod_cliente INT := 1;
-- v_cod_conta INT := 2;
-- v_valor NUMERIC(10, 2) := 200;
-- v_saldo_resultante NUMERIC (10, 2);
-- v_saldo_original NUMERIC (10,2);
--  BEGIN
--  SELECT fn_depositar(
--  	 v_cod_cliente,
--   	v_cod_conta,
--   	v_valor
--  )INTO v_saldo_resultante;
--  RAISE NOTICE
--  	'Origibal %, Depositado: % , Resultante: %',
-- 	 v_saldo_original,
--  	v_valor,
--  	v_saldo_resultante;
--  END;
--  $$



-- DROP ROUTINE IF EXISTS fn_depositar;
-- CREATE OR REPLACE FUNCTION fn_depositar(
-- 	IN p_cod_cliente INT,
-- 	IN p_cod_conta INT,
-- 	IN p_valor NUMERIC (10,2)
-- )RETURNS NUMERIC (10,2) LANGUAGE plpgsql AS $$
-- DECLARE 
-- 	v_saldo_resultante NUMERIC(10,2);
-- BEGIN
-- 	UPDATE tb_conta SET 
-- 	  saldo = saldo + p_valor
-- 	WHERE 
-- 	  cod_cliente = p_cod_cliente
-- 	  AND cod_conta = p_cod_conta;
-- 	SELECT saldo FROM tb_conta c WHERE c.cod_cliente = p_cod_cliente 
-- 	AND c.cod_conta = p_cod_conta INTO v_saldo_resultante;
-- 	RETURN v_saldo_resultante;
-- 	RETURN -1;
-- END;
-- $$

	
	  

-- DO $$
-- DECLARE 
-- 	v_cod_cliente INT := 1;
-- 	v_saldo NUMERIC (10,2) := 500;
-- 	v_cod_tipo_conta INT := 1;
-- 	v_resultado BOOLEAN;
-- BEGIN
-- 	SELECT fn_abrir_conta(
-- 		v_cod_cliente,
-- 		v_saldo,
-- 		v_cod_tipo_conta
-- 	) INTO v_resultado;
-- 	RAISE NOTICE 
-- 	 '%',
-- 	CASE WHEN 
-- 	 v_resultado = TRUE THEN
-- 	 	'Conta foi aberta'
-- 	   ELSE 
-- 	    'Conta não foi aberta'
-- 	END;
-- END;
-- $$


-- CREATE OR REPLACE FUNCTION fn_abrir_conta(
-- 	IN p_cod_cli INT,
-- 	IN p_saldo NUMERIC(10,2),
-- 	IN p_tipo_conta INT 
-- ) RETURNS BOOLEAN LANGUAGE plpgsql AS $$
-- BEGIN
-- 	INSERT INTO tb_conta
-- 	(cod_cliente, saldo, cos_tipo_conta)
-- 	VALUES
-- 	($1, $2, $3);
-- 	RETURN TRUE;
-- EXCEPTION WHEN OTHERS THEN
-- 	RETURN FALSE;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	v_resultado BOOLEAN;
-- BEGIN
-- 	SELECT 
-- 		fn_algum('fn_ehnegativo', 1, 2, 3)
-- 	INTO v_resultado;
-- 	RAISE NOTICE '%', CASE WHEN v_resultado = TRUE THEN 'Sim, tem negativos' ELSE 'Não, não tem negativos' END;
-- END;
-- $$

--[1,2,3,4,3,1,7,8]
-- CREATE OR REPLACE FUNCTION fn_eh_negativo(
-- 	IN p_numero INT
-- ) RETURNS BOOLEAN
-- LANGUAGE plpgsql AS $$
-- BEGIN 
-- 	RETURN 
-- 		CASE 
-- 			WHEN p_numero < 0 
-- 				THEN TRUE ELSE FALSE
-- 		END;
-- END;
-- $$

-- CREATE OR REPLACE FUNCTION fn_algum(
-- 	IN p_fn_executa TEXT,
-- 	VARIADIC p_elementos INT []
-- ) RETURNS BOOLEAN 
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE
-- 	v_elemento INT;
-- 	v_resultado BOOLEAN;
-- BEGIN
-- 	FOREACH v_elemento IN ARRAY p_elementos LOOP
-- 		EXECUTE format( --SELECT p_fn_eecute(1)
-- 			'SELECT %s (%s)',
-- 			p_fn_executa,
-- 			v_elemento
-- 		) INTO v_resultado;
-- 		IF v_resultado = TRUE THEN
-- 			RETURN TRUE;
-- 		END IF;
-- 	END LOOP;
-- 	RETURN FALSE;
-- END;
-- $$

--chamando com bloco anonimo 
-- DO $$
-- DECLARE
-- 	v_resultado TEXT;
-- BEGIN
-- -- 	SELECT fn_hello() INTO v_resultado;
-- -- 	RAISE NOTICE '%', v_resultado;
-- -- 	v_resultado := fn_hello();
-- -- 	RAISE NOTICE '%', v_resultado;
-- 	--executando e descartando o resultado
-- 	-- 	PERFORM fn_hello();
-- 	--assim não rola kkk, CALL apenas para procs
-- 	-- 	CALL fn_hello();
-- END;
-- $$

--chamando sem bloco anonimo
-- SELECT fn_hello();

-- CREATE OR REPLACE FUNCTION fn_hello()
-- RETURNS TEXT LANGUAGE plpgsql
-- AS $$
-- BEGIN 
-- 	RETURN 'Hello, Functions!';
-- END;
-- $$