jQuery ->
	$('#enrolled_user_id').chosen();

jQuery ->
	$("#enrolleds").dataTable
		bProcessing: true,
		bServerSide: true,
		sAjaxSource: "/selecao-admin/enrolleds.json"
		sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
		sPaginationType: "bootstrap"
		oLanguage:
		  sProcessing: ""
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
  $("#enrolled_reports_button").click ->
    $("#enrolled_reports_modal").modal(
      show: true
      backdrop: true
      keyboard: true
    )

