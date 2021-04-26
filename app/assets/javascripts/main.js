

jQuery(function(){

    $("#zwavhe").change(function(){
        var filename = $(this).val();
        if($("#zwavhePlayer").length){$("#zwavhePlayer").remove()};
        const player = `<div id="zwavhePlayer"><audio controls='controls' src="./assets/${filename}"></audio></div>`
        $("#leZwavhePlayerContainer").append(player);
    });

    $("#apiTest").click(function(){
        $.ajax({
            url: "/speech/identifySpeaker",
            method: "GET",  
            data: {file: $("#zwavhe").val()},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response); 
            }
        });
    });
    

});