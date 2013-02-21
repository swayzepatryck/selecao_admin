jQuery ->
	$("#onlineLectureAjaxTable").dataTable
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
  jQuery("#online_lecture").hide()
  jQuery("#attendance_lecture").hide()

jQuery ->
	$("#lecture_lecture_type_id").change ->
	  if $(this).find("option:selected").val() is '1'
	    jQuery("#online_lecture").hide()
	    jQuery("#attendance_lecture").show()
	  else if $(this).find("option:selected").val() is '2'
	    jQuery("#attendance_lecture").hide()
	    jQuery("#online_lecture").show()

jQuery ->
	$('#lecture_announcement_id').chosen();
	
jQuery ->
	$('#lecture_campus_id').chosen();
	
jQuery(document).ready ->
  $("#lecture_reports_button").click ->
    $("#lecture_reports_modal").modal(
      show: true
      backdrop: true
      keyboard: true
    )