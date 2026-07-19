function i18n(br, en, es){
	if (localStorage._lang){
		switch(localStorage._lang) {
			case "0":
				return br;
				break;
			case "1":
				return en;
				break;
			case "2":
				return es;
				break;
			default:
				return br;
		}           
	} else {
		return br;
	}	
}

function strUserName() {
	return i18n("Usuário", "User Name", "Usuario");
}

function strPassword() {
	return i18n("Password", "Senha", "Contraseña");
}

function strHome() {
	return i18n("Início", "Home", "Home");
}

function strExport() {
	return i18n("Exportação", "Export", "Exportación");
}

function strImport() {
	return i18n("Importação", "Import", "Importación");
}

function strLogout() {
	return i18n("Sair", "Logout", "Cerrar sesión");
}

function strNoRecordFound() {
	return i18n('Nenhuma registro encontrada.', 'No record found.', 'No se encontró ningún registro.');
}

function strApplyFilter() {
	return i18n('Filtrar', 'Filter', 'Filtro');
}

function strCancel() {
	return i18n('Cancelar', 'Cancel', 'Cancelar');
}

function strOrder() {
	return i18n('Pedido', 'Request', 'Solicitud');
}

function strMerchandise() {
	return i18n('Mercadoria', 'Good', 'Mercancia');
}

function strExporter() {
	return i18n('Exportador', 'Shipper', 'Exportador');
}

function strBLNumber() {
	return i18n('Número do BL', 'BL Number', 'Número del BL');
}

function strClient() {
	return i18n('Cliente', 'Customer', 'Cliente');
}

function strCurrentStatus() {
	return i18n('Status Atual', 'Updated Status', 'Estado atual');
}

function strAll() {
	return i18n('Todos','All','Todos');
}

function strAwaitingLoading() {
	return i18n('Aguardando carregamento','Awaiting loading','Aguardando cargamento (o recolección)');
}

function strAwaitingInvoiceDispatch() {
	return i18n('Aguardando envio Invoice','Awaiting Invoice dispatch','Aguardando envio de la Factura');
}

function strAwaitingDeparture() {
	return i18n('Aguardando embarque','Awaiting departure','Aguardando embarque');
}

function strDeparture() {
	return i18n('Embarque','Departure','Embarque');
}

function strAwaitingOriginalDocsDispatch() {
	return i18n('Aguardando Envio de docs originais','Awaiting original docs dispatch','Aguardando envio de los documentos originales');
}

function strAwaitingArrivalAtDestination() {
	return i18n('Aguardando chegada no destino','Awaiting arrival at destination','Aguardando llegada en el destino');
}

function strArrivalAtDestination() {
	return i18n('Chegada no destino','Arrival at destination','Llegada en el destino');
}

function strFileName() {
	return i18n('Nome Arquivo','File Name','Nombre de archivo');
}

function strData() {
	return i18n('Data','Date','Fecha');
}

function strNotificacao() {
	return i18n('Notificação','Notification','Notificación');
}

function strTypeDocument() {
	return i18n('Tipo Documento','Type Document','Tipo Documento');
}

function strDocuments() {
	return i18n('Documentos','Documents','Documentos');
}

function strName() {
	return i18n('Nome','Name','Nombre');
}

function strEvents() {
	return i18n('Eventos','Events','Eventos');
}

function strOutputTransport() {
	return i18n('Saída Transporte','Output Transport','Salida Transporte');
}

function strDisembarkation() {  		

	return i18n('Desembaraço','Customs Cleareance','Liberación Aduanera');
}

function strFactoryCharge() {
	return i18n('Carregamento na Fabrica','Loaded at Plant','Cargamento');
}

function strProcessRelease() {
	return i18n('Liberação do Processo','Broker Process started','Fecha Programación');
}

function strQtyContainers() {
	return i18n('Qtd. Conteiners','Qty Containers','Qtd. Containers');
}

function strContainer() {
	return i18n('Conteiner','Container','Container');
}

function strNetWeight() {
	return i18n('Peso Líquido','Net weight','Peso Neto');
}

function strGrossWeight() {
	return i18n('Peso bruto','Gross Weight','Peso Bruto');
}

function strChannel() {
	return i18n('Canal','Approach Channel','Canal');
}

function strDestinyCountry() {
	return i18n('País de Destino','Destination Country','País de Destino');
}

function strRefCustomer() {
	return i18n('Referência Cliente','Customer preference','Referencia del cliente');
}

function strBasicData() {
	return i18n('Dados Básicos','Basic Data','Datos Básicos');
}

function strDepartureShipTruckFlightOrCross() {
	return i18n('Saída do Voo','Shipping Departure','Salida del Embarque');
}

function strShippingDeparture() {
	return i18n('Saída do Navio','Shipping Departure','Salida del Embarque');
}

function strBroderCrossing() {
	return i18n('Cruze','Broder Crossing','Cruce en Frontera');
}

function strBorderArrival() {
	return i18n('Chegada na Fronteira','Border Arrival','Llegada en  Frontera');
}

function strArrivalShipPlaneTruck() {
	return i18n('Chegada do Navio/Avião/Caminhão','Vessel/Plane/Truck arrival','Llegada del Barco/Avión/Camión');
}

function strLoadPresence() {
	return i18n('Presença de carga','Cargo Manifest','Presencia de carga');
}

function strRecordDI_DUIMP() {
	return i18n('Registro DI/DUIMP','DI/DUIMP Registration','Registro DI/DUIMP');
}

function strReleaseForCarrier() {
	return i18n('Liberação para Transportadora','Release to carrier','Liberación para Transportadora');
}

function strMercadoriaNaFabrica() {
	return i18n('Mercadoria na Fábrica', 'Cargo Delivery at Plant', 'Mercadería en la Fábrica');
}

function strAmount() {
	return i18n('Quantidade','Quantity','Cantidad');
}

function strDeliveryDateRevised() {
	return i18n('Delivery Date Revisada','Revised delivery date','Fecha revisada de entrega');
}

function strDescription() {
	return i18n('Descrição','Description','Descripción');
}

function strBoardedAwaitingArrival() {
	return i18n('Embarcado, Aguardando chegada','Boarded, awaiting arrival','Embarcado, aguardando llegada');
}

function strAtClearence() {
	return i18n('Em desembaraço','At Clearence','En liberación');
}

function strClearedAwaitingDeliverySchedule() {
	return i18n('Desembaraçado, aguardando programação de entrega','Cleared, awaiting delivery schedule','Liberado, aguardando programación de entrega');
}

function strScheduledAwaitingDeliveryFactory() {
	return i18n('Programado, aguardando entrega na fabrica','Scheduled, awaiting delivery at factory','Programado, aguardando entrega en la planta');
}

function strCargoDelivered() {
	return i18n('Carga entregue','Cargo delivered','Carga entregada');
}

function strIndaiaReference() {
	return i18n('Referencia Indaia', 'Indaia Reference', 'Referencia Indaia');
}

function strBtnFiltrar() {
	return i18n('Filtrar', 'Filter', 'Filtro');
}

function strBtnCancelar() {
	return i18n('Cancelar', 'Cancel', 'Cancelar');
}

function strAnuencia() {
	return i18n('Anuência', 'Approval', 'Anuencia');
}



// Relatório processos em andamento "WIMS"

function strProcessoIndaia() {
	return i18n('Processo Indaia', 'Indaia#', 'Referencia Indaia');
}

function strEmbarque() {
	return i18n('Embarque', 'Order#', 'Referencia del cliente');
}

function strCliente() {
	return i18n('Cliente', 'Customer', 'Cliente');
}

function strMercadoria() {
	return i18n('Mercadoria', 'Products', 'Mercancia');
}

function strPrevCarregamento() {
	return i18n('Prev. Carregamento', 'Estimated Loading at plant', 'Previsión del Cargamento');
}

function strCarregamentoFabrica() {
	return i18n('Carregamento na Fabrica', 'Loaded', 'Cargado');
}

function strCntrPorto() {
	return i18n('Cntr. no Porto - 315', 'Delivery in Loading Terminal', 'Entrega en la Terminal de Embarque');
}

function strDesembaraco() {
	return i18n('Desembaraço', 'Clearance', 'Liberación Aduanera');
}

function strSaidaNavio() {
	return i18n('Saida do Navio', 'Shipment Date', 'Salida del Buque / Vuelo / Camión');
}

function strEnvioDocumentos() {
	return i18n('Envio de Documentos', 'Documents to the Customer / Importer', 'Envio de Doctos. al Cliente / Importador');
}

function strChegadaDestino() {
	return i18n('Chegada no Destino', 'Arrival at Destination', 'Llegada de la Mercancia en Destino');
}


































