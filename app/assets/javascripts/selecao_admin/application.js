//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require chosen-jquery
//= require select2
//= require jquery.validate
//= require jquery.validationEngine-pt	
//= require jquery.validationEngine
//= require selecao_admin/seedrandom
//= require_tree .

JSON.stringify = JSON.stringify || function (obj) {
    var t = typeof (obj);
    if (t != "object" || obj === null) {
        // simple data type
        if (t == "string") obj = '"'+obj+'"';
        return String(obj);
    }
    else {
        // recurse array or object
        var n, v, json = [], arr = (obj && obj.constructor == Array);
        for (n in obj) {
            v = obj[n]; t = typeof(v);
            if (t == "string") v = '"'+v+'"';
            else if (t == "object" && v !== null) v = JSON.stringify(v);
            json.push((arr ? "" : '"' + n + '":') + String(v));
        }
        return (arr ? "[" : "{") + String(json) + (arr ? "]" : "}");
    }
};

jQuery(function() {
  return $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
});

jQuery(function() {
  return $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
});

function update_student_quotas_div(enrollment_id) {  
  jQuery.ajax({
    url: "/selecao-admin/find/drawing_student_quotas/" + enrollment_id,
    type: "GET",
    data: {"enrollment_id" : enrollment_id},
    dataType: "html",
    success: function(data) {
      jQuery("#studentQuotasDiv").html(data);
    }
  });
}
