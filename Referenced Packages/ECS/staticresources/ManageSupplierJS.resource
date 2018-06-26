jQuery(document).ready(function(){
    
    // VALIDATION INIT

    var form = $( "[id$=theForm]" );

    form.validate({

    	submitHandler : function(form) {

    	    form.submit();

    	}

    });

    // VALIDATION RULES
      
    $('[id$=firstname]').rules("add",{
        required: true
    });     
     
    $('[id$=lastname]').rules("add",{
        required: true
    });   

    //$(‘[id$=phone]').rules("add",{
    //    required: true
    //});

    $('[id$=email]').rules("add",{
        required: true
    });   
     
    //$(‘[id$=shippingstreet]').rules("add",{
    //    required: true
    //});
     
    //$(‘[id$=city]').rules("add",{
    //    required: true
    //});

    //$(‘[id$=shippingStateOption]').rules("add",{
    //    required: true
    //});

    //$(‘[id$=shippingStateOptionUS]').rules("add",{
    //    required: true
    //});

    //$(‘[id$=shippingStateOptionCA]').rules("add",{
    //    required: true
    //});

    //$(‘[id$=shippingpostalcode]').rules("add",{
    //    required: true
    //});   

    //$(‘[id$=shippingCountryOption]').rules("add",{
    //    required: true
    //});   
     
    // Customized the messages
    jQuery.validator.messages.required = "Please fill the required field"; 
    //jQuery.validator.messages.equalTo = "";

});