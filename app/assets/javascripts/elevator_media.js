// function getLocation() {
//     if (navigator.geolocation) {
//         navigator.geolocation.getCurrentPosition(showPosition);
//         // console.log(navigator.geolocation.getCurrentPosition.coords.latitude);
//         // console.log(navigator.geolocation.getCurrentPosition.coords.longitude);
//     } else {
//         console.log("Geolocation is not supported by this browser.");
//     }
// }
// function showPosition(position) {
//     console.log("Latitude: " + position.coords.latitude);
//     console.log("Longitude: " + position.coords.longitude);
//     $(document)
//                 .find('#weathertest')
//                 .empty()
//                 .append( position.coords.latitude, position.coords.longitude )
// }

function callController(url) {
    $.ajax({
        url: url,
        method: "GET",  
        success: function (response) {
            $(document)
                .find('#streamer')
                .empty()
                .append( response )        
        }
     });
}

jQuery(function(){
    $("#weather_form").attr("class", "hidden");
    $("#joke").attr("class", "hidden");
    $("#gif").attr("class", "hidden");
    $("#advice").attr("class", "hidden");
    $("#prog_joke").attr("class", "hidden");
    $("#dark_joke").attr("class", "hidden");

    $("#initial_select").change(function(){
        $("#weather_form").attr("class", "hidden");
        $("#joke").attr("class", "hidden");
        $("#gif").attr("class", "hidden");
        $("#advice").attr("class", "hidden");
        $("#prog_joke").attr("class", "hidden");
        $("#dark_joke").attr("class", "hidden");
        
        var selection = $(this).val();
        switch(selection){
            case "1":
                $("#weather_form").attr("class", "");
                console.log("1");
                break;
            case "2":
                $("#joke").attr("class", "");
                console.log("2");
                break;
            case "3":
                $("#gif").attr("class", "");
                console.log("3");
                break;
            case "4":
                $("#advice").attr("class", "");
                console.log("4");
                break;
            case "5":
                $("#prog_joke").attr("class", "");
                console.log("5");
                break;
            case "6":
                $("#dark_joke").attr("class", "");
                console.log("6");
                break;
            default:
                console.log("oopsie!")
        }
    });


    $("#city_btn").click(function(){
        var city = $("#getWeather_city").val();
        $.ajax({
            url: "/getWeather",
            method: "GET",  
            data: {city: city},
            success: function (response) {
                $(document)
                    .find('#streamer')
                    .empty()
                    .append( response )        
            }
         });
    });

    $("#joke_btn").click(function(){callController('/getJoke')});
    $("#gif_btn").click(function(){callController('/getGif')});
    $("#advice_btn").click(function(){callController('/getAdvice')});
    $("#prog_joke_btn").click(function(){callController('/getProgJoke')});
    $("#dark_joke_btn").click(function(){callController('/getDarkJoke')});
});