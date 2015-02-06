
//Adds checkbox via icheck plugin
//$('.i-checks').iCheck({
//  checkboxClass: 'icheckbox_square-green',
//  radioClass: 'iradio_square-green'
//});


//Shows/Hides fields for adding weight by decimal or pounds/ounces
$('#weight-formating').click(function() {
  console.log("clicking things")

  if($('#format_pounds_ounces').is(':checked')){
    $("#pounds-decimal").hide(1000);
    $("#pounds-ounces").show(1000);
  } else {
    $("#pounds-ounces").hide(1000);
    $("#pounds-decimal").show(1000);
  }
});
