$.validator.setDefaults({
    submitHandler: function() {
        $('#user_submit').prop("disabled", true); // Disable submit button until AJAX call is complete to prevent duplicate messages
        $.ajax({
        url: "/v1/users",
        type: "POST",
        dataType: 'json',
        contentType: "application/json",
        data: JSON.stringify($("form#new_user").serializeJSON()),
        cache: false,
        success: function(e) {
            // Success message
            $('#modalCookieBodyText').text(e.message);
            $('#modalCookie').modal('show');
            //clear all fields
            $('#contactForm').trigger("reset");
        },
        error: function(e) {
            // Fail message
            $('#modalCookieBodyText').html(e.responseJSON.message + "<BR>" + e.responseJSON.errors.toString().replace(/,/g,'<BR>'));
            $('#modalCookie').modal('show');
        },
        complete: function() {
            setTimeout(function() {
            $('#user_submit').prop("disabled", false); // Re-enable submit button when AJAX call is complete
            }, 1000);
        }
        });
    }
});

$().ready(function() {
    // validate the user form when it is submitted
    $("#new_user").validate();
});





   