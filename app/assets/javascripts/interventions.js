jQuery(function(){
    $("#building_label").attr("class", "hidden");
    $("#intervention_building_id").attr("class", "hidden");
    $("#battery_label").attr("class", "hidden");
    $("#intervention_battery_id").attr("class", "hidden");
    $("#column_label").attr("class", "hidden");
    $("#intervention_column_id").attr("class", "hidden");
    $("#elevator_label").attr("class", "hidden");
    $("#intervention_elevator_id").attr("class", "hidden");
    $("#intervention_elevator_id").empty();
    $("#intervention_column_id").empty();
    $("#intervention_elevator_id").append('<option value="None">None</option>');
    $("#intervention_column_id").append('<option value="None">None</option>');
    
    $("#intervention_customer_id").change(function(){
        var customer = $(this).val();
        if(customer == ''){
            $("#intervention_building_id").attr("class", "hidden");
            $("#building_label").attr("class", "hidden");
        }else{
            $("#intervention_building_id").attr("class", "form-control");
            $("#building_label").attr("class", "");
        }
        $.ajax({
            url: "/get_buildings",
            method: "GET",  
            dataType: "json",
            data: {customer: customer},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var buildings = response["buildings"];
                $("#intervention_building_id").empty();
                $("#intervention_building_id").append('<option value="None">Select a Building</option>');
                if (buildings.length > 0) {
                    for(var i = 0; i < buildings.length; i++){
                        $("#intervention_building_id").append('<option value="' + buildings[i]["id"] + '">' +buildings[i]["building_address"] + '</option>');
                    }
                }else{
                    $("#intervention_building_id").empty();
                    $("#intervention_building_id").append('<option value="None">None</option>')}
            }
        });
    });
    $("#intervention_building_id").change(function(){
        $("#battery_label").attr("class", "hidden");
        $("#intervention_battery_id").attr("class", "hidden");
        $("#column_label").attr("class", "hidden");
        $("#intervention_column_id").attr("class", "hidden");
        $("#elevator_label").attr("class", "hidden");
        $("#intervention_elevator_id").attr("class", "hidden");
        $("#intervention_battery_id").empty();
        $("#intervention_column_id").empty();
        $("#intervention_elevator_id").empty();
        var building = $(this).val();
        if(building == ''){
            $("#intervention_battery_id").attr("class", "hidden");
            $("#battery_label").attr("class", "hidden");
        }else{
            $("#intervention_battery_id").attr("class", "form-control");
            $("#battery_label").attr("class", "");
        }
        $.ajax({
            url: "/get_batteries",
            method: "GET",  
            dataType: "json",
            data: {building: building},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var batteries = response["batteries"];
                $("#intervention_battery_id").empty();
                $("#intervention_battery_id").append('<option value="None">Select a Battery</option>');
                if (batteries.length > 0) {
                    for(var i = 0; i < batteries.length; i++){
                        $("#intervention_battery_id").append('<option value="' + batteries[i]["id"] + '">' +batteries[i]["id"] +" "  +batteries[i]["status"] + '</option>');
                    }
                }else{
                    $("#intervention_column_id").empty();
                    $("#intervention_column_id").append('<option value="None">None</option>')}
                
            }
        });
    });
    $("#intervention_battery_id").change(function(){
        $("#intervention_column_id").empty();
        $("#intervention_elevator_id").empty();
        $("#column_label").attr("class", "hidden");
        $("#intervention_column_id").attr("class", "hidden");
        $("#elevator_label").attr("class", "hidden");
        $("#intervention_elevator_id").attr("class", "hidden");
        var battery = $(this).val();
        if(battery == ''){
            $("#intervention_column_id").attr("class", "hidden");
            $("#column_label").attr("class", "hidden");
        }else{
            $("#intervention_column_id").attr("class", "form-control");
            $("#column_label").attr("class", "");
        }
        $.ajax({
            url: "/get_columns",
            method: "GET",  
            dataType: "json",
            data: {battery: battery},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var columns = response["columns"];
                $("#intervention_column_id").empty();
                // $("#column_id").append('<option value="None">Select Column</option>');
                $("#intervention_column_id").append('<option value="None">None</option>');
                if (columns.length > 0) {
                    for(var i = 0; i < columns.length; i++){
                        $("#intervention_column_id").append('<option value="' + columns[i]["id"] + '">' +columns[i]["id"] +" "  +columns[i]["status"] + '</option>');
                    }
                }else{
                    $("#intervention_column_id").empty();
                    $("#intervention_column_id").append('<option value="None">None</option>')}
            }
        });
    });
    $("#intervention_column_id").change(function(){
        $("#elevator_label").attr("class", "hidden");
        $("#intervention_elevator_id").attr("class", "hidden");
        $("#intervention_elevator_id").empty();
        var column = $(this).val();
        if(column == ''){
            $("#intervention_elevator_id").attr("class", "hidden");
            $("#elevator_label").attr("class", "hidden");
        }else{
            $("#intervention_elevator_id").attr("class", "form-control");
            $("#elevator_label").attr("class", "");
        }
        $.ajax({
            url: "/get_elevators",
            method: "GET",  
            dataType: "json",
            data: {column: column},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var elevators = response["elevators"];
                $("#intervention_elevator_id").empty();
                // $("#elevator_id").append('<option value="None">Select Elevator</option>');
                $("#intervention_elevator_id").append('<option value="None">None</option>');
                if (elevators.length > 0) {
                    for(var i = 0; i < elevators.length; i++){
                        $("#intervention_elevator_id").append('<option value="' + elevators[i]["id"] + '">' +elevators[i]["id"] +" "  +elevators[i]["status"] + '</option>');
                    }
                }else{
                    $("#intervention_elevator_id").empty();
                    $("#intervention_elevator_id").append('<option value="None">None</option>')}

            }
        });
    });
});