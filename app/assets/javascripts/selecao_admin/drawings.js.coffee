jQuery ->
  $('#drawing_student_quota_ids').chosen()

#jQuery ->
#  $('#drawing_employee_id').select2()

jQuery ->
  $('#drawing_enrollment_id').chosen()

jQuery ->
	$("#drawingAjaxTable").dataTable
	  sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
	  sPaginationType: "bootstrap"
	  oLanguage:
	    sProcessing: "Aguarde enquanto os dados são carregados ..."
	    sLengthMenu: "Mostrar _MENU_ registros por pagina"
	    sZeroRecords: "Nenhum registro correspondente ao criterio encontrado"
	    sInfoEmtpy: "Exibindo 0 a 0 de 0 registros"
	    sInfo: "Exibindo de _START_ a _END_ de _TOTAL_ registros"
	    sInfoFiltered: ""
	    sSearch: "Procurar: "
	    oPaginate:
	      sFirst: "Primeiro"
	      sPrevious: "Anterior"
	      sNext: "Próximo"
	      sLast: "Último"
	      
jQuery(document).ready ->
  $("#drawing_reports_button").click ->
    $("#drawing_reports_modal").modal(
      show: true
      backdrop: true
      keyboard: true
    )	      
	
# Processamento do Sorteio	
# INSTITUTO FEDERAL DE BRASÍLIA - CAMPUS TAGUATINGA/REITORIA
# Autores: Antonielly Garcia Rodrigues, Alex Helder Cordeiro de Oliveira, Renato Carvalho de Souza
# 2013/01/15

gereEImprimaResultado = ->
  nomeCurso = document.sorteio.nomeCurso.value

  #var inscritos = document.sorteio.totalInscritos.value;
  array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "z"]
  semente = undefined
  if document.sorteio.sementeManual.checked
    semente = document.sorteio.semente.value
  else
    semente = new Date().getTime()
  vagas = document.sorteio.vagas.value

  #var embaralhada = gereListaEmbaralhada(inscritos, semente);
  embaralhada = gereListaEmbaralhada(array, semente)

  #var pontoImpressao = //document.sorteio.textArea;
  pontoImpressao = document.getElementById("resultado")
  imprimaResultado nomeCurso, semente, embaralhada, vagas, pontoImpressao

#function gereListaEmbaralhada(inscritos, semente){
gereListaEmbaralhada = (array, semente) ->
  Math.seedrandom semente

  # var consumida = new Array(inscritos);
  # var resultado = new Array(inscritos);
  # for(var i = 0; i < inscritos; i++) {
  # 	consumida[i] = 1+i;
  # 	resultado[i] = 0;
  # }
  # 
  # for(var i = 0; i < inscritos; i++) {
  # 	var aleatorio = Math.floor(Math.random()*inscritos);
  # 	while(consumida[aleatorio] == 0) {
  # 		aleatorio = (1+aleatorio)%inscritos;
  # 	}
  # 	resultado[i] = consumida[aleatorio];
  # 	consumida[aleatorio] = 0;
  # }
  # 
  # return resultado;
  i = array.length - 1

  while i > 0
    j = Math.floor(Math.random() * (i + 1))
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    i--
  array

imprimaResultado = (nomeCurso, semente, embaralhada, vagas, pontoImpressao) ->
  conteudo = ""
  conteudo += gereVisualDeCabecalhoDaLista(nomeCurso)
  conteudo += gereVisualDeListaDeSelecionados(embaralhada, vagas)
  conteudo += gereVisualDeCabecalhoDaEspera(nomeCurso)
  conteudo += gereVisualDeListaDeEspera(embaralhada, vagas)
  conteudo += gereVisualDeFim()
  conteudo += gereVisualDeInformacoesTecnicas(semente)

  #pontoImpressao.value = conteudo;
  pontoImpressao.innerHTML = conteudo

gereVisualDeCabecalhoDaLista = (nomeCurso) ->
  "<H1>Lista <b>OFICIAL</b> do sorteio - " + nomeCurso + "</H1><H2>Primeira chamada</H2>"

gereVisualDeListaDeSelecionados = (lista, ultimaPosicao) ->
  conteudo = ""
  i = 0

  while i < ultimaPosicao
    conteudo += "<font size='5'><b>" + lista[i] + "</b></font>"
    conteudo += "<br/>"  if i < ultimaPosicao - 1
    i++
  conteudo

gereVisualDeCabecalhoDaEspera = (nomeCurso) ->
  "<H2>Lista de Espera - " + nomeCurso + "</H2>"

gereVisualDeListaDeEspera = (lista, ultimaPosicao) ->
  conteudo = ""
  i = ultimaPosicao

  while i < lista.length
    conteudo += lista[i]
    conteudo += "<br/>"  if i < lista.length - 1
    i++
  conteudo

gereVisualDeFim = ->
  "<br/><b>FIM.</b>"

gereVisualDeInformacoesTecnicas = (semente) ->
  conteudo = "<H3>Informa��es t�cnicas do sistema</H3>"
  conteudo += "<b>platform:</b> " + navigator.platform + "<br/>"
  conteudo += "<b>appName:</b> " + navigator.appName + "<br/>"
  conteudo += "<b>appVersion:</b> " + navigator.appVersion + "<br/>"
  conteudo += "<b>userAgent:</b> " + navigator.userAgent + "<br/>"
  conteudo += "<b>Vers�o deste sistema:</b> 2010/09/17<br/>"
  conteudo += "<b>Semente utilizada:</b> \"" + semente + "\"<br/>"
  conteudo

$("#shuffle_fields_processing").slideUp(300).delay(800).fadeIn 400