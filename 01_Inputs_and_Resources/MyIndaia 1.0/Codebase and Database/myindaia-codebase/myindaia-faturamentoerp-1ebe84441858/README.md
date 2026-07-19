## FATURAMENTO ##


# PRINCIPAIS TABELAS #

Fonte: Vanessa

Capa da Fatura

select * from Billing where id=26

Ligaçao dos itens com a fatura

select * from Billing_ItemInvoiced where Billing_id=26

Itens e valores da fatura

select * from ItemInvoiced where id in (34,35)

Pagamentos

Fatura ligada ao pagamento

SELECT * FROM BILLING_PAYMENTREQUESTED

Capa do Pagamento

SELECT * FROM PAYMENTREQUESTED

Ligação dos itens com o pagamento

SELECT * FROM PAYMENTREQUESTED_ITEMPAYMENTREQUESTED

Itens e valores do pagamento

SELECT * FROM ITEMPAYMENTREQUESTED

Recebimento de Numerario ligada a Fatura

SELECT * FROM BILLING_CASHREQUESTED

Capa do Numerario

SELECT * FROM CASHREQUESTED

ligação dos itens com o numerario

SELECT * FROM CASHREQUESTED_ITEMCASHREQUESTED

itens e valores do numerario

SELECT * FROM ITEMCASHREQUESTED

Processos do Financeiro

select * from CustomClearance

# WebService #

Foi desenvolvido o método “AtualizarTitulosProcessos” no serviço “com.senior.g5.co.mcm.ven.notafiscal” de geração de notas fiscais, este método deve ser chamado logo após o OK,  no processo da geração da nota fiscal de débito, e dentro do nó “titulosCP”.
 
O serviço está publicado e ambiente de homologação.
 
WSDL: http://senior-hmlg:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mcm_ven_notafiscal?wsdl