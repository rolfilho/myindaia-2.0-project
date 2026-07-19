// Função Data de Hoje
var now = new Date();
var dayNr = now.getDate();
var yearNr = now.getYear();

// Dia da Semana
var dName = now.getDay();
var Day = new Array("Domingo", "Segunda-Feira", "Ter&ccedil;a-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "S&aacute;bado")

// Mês corrente
var mName = now.getMonth();
var Mouth = new Array("Janeiro", "Fevereiro", "Mar&ccedil;o", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")

//Devolve a data de hoje
if(yearNr < 2000) Year = 1900 + yearNr;
else Year = yearNr;
var DataHoje =(Day[dName] + ", " + dayNr + " de " + Mouth[mName] + " de " + Year);
document.write(DataHoje)