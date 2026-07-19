//https://tableless.com.br/paginacao-com-javascript-e-jquery/

function pagination(novaPesquisa, qtdResultAtual) {
    //Pegamos o valor selecionado default no select id="qtd"
      var mostrar_por_pagina = 10;//$('#qtd').val(); 
    //quantidade de divs
      var qtd_itens_total = $('#sec-container').children('.linhaResult').length;

      var qtd_por_consulta = 30;
     //fazemos uma calculo simples para saber quantas paginas existiram
      var numero_de_paginas = Math.ceil(qtd_itens_total / mostrar_por_pagina);

      var qtd_paginas_visiveis = Math.ceil(qtd_por_consulta / mostrar_por_pagina);

      var grupo_pagina_atual = $('#grupo_pag_atual').val();

    //Colocamos a div class controls dentro da div id pagi
//    $('#qtd_resultado_atual').val(qtd_itens_total);
      
      if ($('.controls-rodape').length) {
        $('.controls-rodape').remove()
      };

      if (qtd_itens_total > mostrar_por_pagina) {
        
        $('#pagi-rodape').css('display', 'block');
        $('#pagi-rodape').append('<div class=controls-rodape></div>');

        //Criamos os links de navegação
        var nevagacao = '<li class="page-item"><a class="page-link prev" href="#" onclick="grupoAnterior()">&Lt;</a></li>'+
                        '<li class="page-item"><a class="page-link prev" href="#" onclick="anterior()">&lt;</a></li>';
        var link_atual = 0;
        while (numero_de_paginas > link_atual) {
          nevagacao += '<li class="page-item page-item-'+link_atual+'"><a class="page-link page-link-numero" href="#"  onclick="ir_para_pagina(' + link_atual + ')" longdesc="' 
          + link_atual + '">' + (link_atual + 1) + '</a></li>';
          link_atual++;
        }
        nevagacao += '<li class="page-item"><a class="page-link proxima " href="#" onclick="proxima()">&GT;</a></li>' + 
                     '<li class="page-item"><a class="page-link carrega " href="#" onclick="proximoGrupo()">&Gt;</a></li>';
        //colocamos a nevegação dentro da div class controls
        $('.controls-rodape').html(" <div class='container font-italic text-primary qtd-processos'> Total de processos: " + qtdResultAtual + "</div>" +
                                   " <nav aria-label='...'><ul class='pagination justify-content-center'>"+nevagacao+"</ul></nav>");      
        //atribuimos ao primeiro link a class active      
        if (novaPesquisa) {
          $('#qtd_paginas_visiveis').val(qtd_paginas_visiveis);        
          $('#mostrar_por_pagina').val(mostrar_por_pagina);
          $('#current_page').val(0);
          
          $('.page-item-0').addClass('active');      
          $('.controls-rodape .page-link-numero:first').addClass('active');              
          $('#sec-container').children('.linhaResult').css('display', 'none');
          $('#sec-container').children('.linhaResult').slice(0, mostrar_por_pagina).css('display', 'block');
        } else {
          mostraProximoGrupo();
        }
      } else {
        $('#pagi-rodape').css('display', 'block');
        $('#pagi-rodape').append('<div class=controls-rodape></div>');       
        $('.controls-rodape').html(" <div class='container font-italic text-primary qtd-processos'> Total de processos: " + qtdResultAtual + "</div>");
      } 

  };

function ir_para_pagina(numero_da_pagina) {
      //Pegamos o número de itens definidos que seria exibido por página
      var mostrar_por_pagina = parseInt($('#mostrar_por_pagina').val(), 0);
      var pagina_anterior = parseInt($('#current_page').val(), 0);
      //pegamos  o número de elementos por onde começar a fatia
      console.log("numero_da_pagina: " + numero_da_pagina);
      inicia = numero_da_pagina * mostrar_por_pagina;
     //o número do elemento onde terminar a fatia
      end_on = inicia + mostrar_por_pagina;
     $('#sec-container').children('.linhaResult').css('display', 'none').slice(inicia, end_on).css('display', 'block');

     $('.page-item-'+numero_da_pagina).addClass('active').siblings('.active').removeClass('active');      
     $('.page-link[longdesc=' + numero_da_pagina+ ']').addClass('active').siblings('.active').removeClass('active');
     $('.page-link[longdesc=' + numero_da_pagina+ ']').append('<span class="sr-only">(atual)</span>');
     $('#current_page').val(numero_da_pagina);
  }

 function anterior() {
    var current_page = (parseInt($('#current_page').val(), 0) + 1);
    var qtd_paginas_visiveis = parseInt($('#qtd_paginas_visiveis').val(), 0);
    var grupoAtual = Math.ceil(current_page / qtd_paginas_visiveis);
    var pri_pag_grupo = parseInt((grupoAtual * qtd_paginas_visiveis) - (qtd_paginas_visiveis - 1)); 

    //se houver um item antes do link ativo atual executar a função
    //if ($('.page-link[longdesc=' + nova_pagina+ ']').length == true) {

    if (current_page == pri_pag_grupo) {
      grupoAnterior();
    } else {
      var nova_pagina = parseInt($('#current_page').val(), 0) - 1;
      ir_para_pagina(nova_pagina);
    }    
  }

function proxima() {
    var current_page = (parseInt($('#current_page').val(), 0) + 1);
    var qtd_paginas_visiveis = parseInt($('#qtd_paginas_visiveis').val(), 0);
    var grupo = Math.ceil(current_page / qtd_paginas_visiveis);
    var ult_pag_grupo = parseInt((grupo * qtd_paginas_visiveis) - 1);
    var nova_pagina = parseInt($('#current_page').val(), 0) + 1;
      //se houver um item após o link ativo atual executar a função
      // if ($('.page-link-numero[longdesc=' + nova_pagina+ ']').length == true) {

    if ((current_page - 1) == ult_pag_grupo) {
      proximoGrupo();
    } else {  
      ir_para_pagina(nova_pagina);
    };
  }

function proximoGrupo() {
    var current_page = (parseInt($('#current_page').val(), 0) + 1);
    var qtd_paginas_visiveis = parseInt($('#qtd_paginas_visiveis').val(), 0);
    var grupo = Math.ceil(current_page / qtd_paginas_visiveis);

    var qtd_itens_total = $('#sec-container').children('.linhaResult').length;
    var qtd_pag_total = (qtd_itens_total / parseInt($('#mostrar_por_pagina').val(), 0));
    var ultimo_grupo = (qtd_pag_total / qtd_paginas_visiveis);
    
     // console.log("current_page: "+current_page + 
     //             " qtd_paginas_visiveis: "+qtd_paginas_visiveis+
     //             " grupo: "+grupo+
     //             " qtd_itens_total: "+qtd_itens_total+
     //             " qtd_pag_total: "+qtd_pag_total+
     //             " ultimo_grupo: "+ultimo_grupo
     //             );

    if (grupo == ultimo_grupo) {
      pesquisa(false);
    } else {
      mostraProximoGrupo();
    }

  }

function mostraProximoGrupo(){
   var current_page = (parseInt($('#current_page').val(), 0) + 1);
   var qtd_paginas_visiveis = parseInt($('#qtd_paginas_visiveis').val(), 0);
   var grupo = Math.ceil(current_page / qtd_paginas_visiveis);
   var pri_pag_prox_grupo = parseInt(grupo * qtd_paginas_visiveis);
   var ult_pag_prox_grupo = (pri_pag_prox_grupo + qtd_paginas_visiveis)
   // console.log("current_page: "+current_page + 
   //             " qtd_paginas_visiveis: "+qtd_paginas_visiveis+
   //             " grupo: "+grupo+
   //             " pri_pag_prox_grupo: "+pri_pag_prox_grupo+
   //             " ult_pag_prox_grupo: "+ult_pag_prox_grupo);
   $('.page-link-numero').css('display', 'none').slice(pri_pag_prox_grupo, ult_pag_prox_grupo).css('display', 'block');     
   ir_para_pagina(pri_pag_prox_grupo);
}


function grupoAnterior() {
     var current_page = (parseInt($('#current_page').val(), 0) + 1);
     var qtd_paginas_visiveis = parseInt($('#qtd_paginas_visiveis').val(), 0);
     var grupoAtual = Math.ceil(current_page / qtd_paginas_visiveis);
     var pri_pag_grupo = parseInt((grupoAtual * qtd_paginas_visiveis) - (qtd_paginas_visiveis - 1));
     var ult_pag_grupo_ant = pri_pag_grupo - 1;
     var pri_pag_grupo_ant = ult_pag_grupo_ant - qtd_paginas_visiveis;

     // console.log("current_page: "+current_page + 
     //             " qtd_paginas_visiveis: "+qtd_paginas_visiveis+
     //             " grupoAtual: "+grupoAtual+
     //             " pri_pag_grupo: "+pri_pag_grupo+
     //             " ult_pag_grupo_ant: "+ult_pag_grupo_ant +
     //             " pri_pag_grupo_ant: "+pri_pag_grupo_ant
     //             );

     if (grupoAtual > 1) {
        $('.page-link-numero').css('display', 'none').slice(pri_pag_grupo_ant, ult_pag_grupo_ant).css('display', 'block');     
        ir_para_pagina(ult_pag_grupo_ant - 1);       
     } 
  }


  $("#qtd").change(function() {
    console.log("entrou");
    //Removemos os "controles" de paginação
      $(".controls").remove();
    //Pegamos o valor selecionado
      var mostrar_por_pagina = this.value;
     //remontamos a paginação
      var qtd_itens_total = $('#sec-container').children('.linha').length;
      var numero_de_paginas = Math.ceil(qtd_itens_total / mostrar_por_pagina);
      console.log(mostrar_por_pagina + " " + qtd_itens_total + " " + numero_de_paginas);

      //Colocamos a div class controls dentro da div id pagi
      $('#pagi').append('<div class=controls></div><input id=current_page type=hidden><input id=mostrar_por_pagina type=hidden>');
      $('#current_page').val(0);
      $('#mostrar_por_pagina').val(mostrar_por_pagina);
  //Criamos os links de navegação


      var nevagacao = '<li><a class="prev" onclick="anterior()">Prev</a></li>';
      var link_atual = 0;
      while (numero_de_paginas > link_atual) {
          nevagacao += '<li><a class="page-link" onclick="ir_para_pagina(' + link_atual + ')" longdesc="' 
          + link_atual + '">' + (link_atual + 1) + '</a></li>';
          link_atual++;
      }
      nevagacao += '<li><a class="proxima" onclick="proxima()">proxima</a></li>';

   //colocamos a navegação dentro da div class controls
      $('.controls').html("<div class='paginacao'><ul class='pagination pagination-sm'>"+nevagacao+"</ul></div>");
      $('.controls .page:first').addClass('active');
      $('#sec-container').children('.linha').css('display', 'none');
      $('#sec-container').children('.linha').slice(0, mostrar_por_pagina).css('display', 'block');
    
  });