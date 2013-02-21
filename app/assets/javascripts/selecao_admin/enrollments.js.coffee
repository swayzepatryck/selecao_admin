jQuery ->
	$('#enrollment_student_quota_ids').chosen()
	
jQuery ->
  $('#enrollment_score_evaluation_ids').chosen()

$(document).ready ->
  $("#import_enrolled_scores_form").validationEngine()

jQuery(document).ready ->
  jQuery("#score_evaluations").hide()

jQuery ->
  $('#enrollment_course_id').chosen({no_results_text: "Nenhum resultado encontrado"});

jQuery ->
	$('#enrollment_survey_id').chosen({no_results_text: "Nenhum resultado encontrado"});
	
jQuery ->
	$('#enrollment_entry_process_id').chosen({no_results_text: "Nenhum resultado encontrado"});
	
jQuery ->
	$("#enrollmentAjaxTable").dataTable
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
	
jQuery ->
	$(".enrolledScoresAjaxTable").dataTable
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
	
jQuery ->
	$("#enrollmentEnrolledsAjaxTable").dataTable
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
	
jQuery ->
	$("#enrollmentDrawingsEnrolledsAjaxTable").dataTable
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
  $("#enrollment_reports_button").click ->
    $("#enrollment_reports_modal").modal(
      show: true
      backdrop: true
      keyboard: true
    ).css
      width: "auto"
      "margin-left": ->
        -($(this).width() / 2)