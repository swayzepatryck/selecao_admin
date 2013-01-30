jQuery ->
	$("#studentQuotaAjaxTable").dataTable
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
  $("#new_student_quota_modal_button").click ->
    $("#new_student_quota_modal").modal(
      show: true
      backdrop: true
      keyboard: true
    )

jQuery(document).ready ->
  $("#close_student_quota_modal").click ->
    $("#new_student_quota_modal").modal('hide')

jQuery(document).ready ->
  $("#student_quota_reports_button").click ->
    $("#student_quota_reports_modal").modal(
      show: true
      backdrop: true
      keyboard: true
    )
		