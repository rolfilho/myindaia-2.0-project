
//Define calendar(s): addCalendar ("Unique Calendar Name", "Window title", "Form element's name", Form name")
//(Titulo do calendário, data selecionada, nome do campo, nome do formulário)
addCalendar("Calendar1", "Calendário", "dt_order_issue", "sampleform");
addCalendar("Calendar2", "Calendário", "secondinput", "sampleform");

// default settings for English
// Uncomment desired lines and modify its values
// setFont("verdana", 9);
setWidth(90, 1, 15, 1);
// setColor("#cccccc", "#cccccc", "#ffffff", "#ffffff", "#333333", "#cccccc", "#333333");
// setFontColor("#333333", "#333333", "#333333", "#ffffff", "#333333");
setFormat("dd/mm/yyyy");
setSize(157, 174, -157, 10);
// setWeekDay(0);
setMonthNames("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro");
setDayNames("Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado");
setLinkNames("[Fechar]", "[Limpar]");
