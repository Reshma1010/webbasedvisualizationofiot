$(document).ready(function () {
    var rootUrl = window.location.origin;
    if (rootUrl != "https://localhost:7192") {
        rootUrl += "/VisualizingSensors";
    }

    $('[data-toggle="tooltip"]').tooltip();
    $('.aboveTooltip').tooltip({ placement: 'top', trigger: 'manual' }).tooltip('show');
    $('.belowTooltip').tooltip({ placement: 'bottom', trigger: 'manual' }).tooltip('show');

    $(".door-sensor").click(function () {
        $('.modal-dialog').css('max-width', '40%');
        $("#info-modal").find(".modal-title").html("Door Info");
        $(".modal-title").css('margin-left', '170px');
        var doorID = $(this).data("doorid");
        $.ajax({
            url: rootUrl + '/Door/GetByID',
            type: 'GET',
            data: { id: doorID },
            success: function (result) {
                $("#info-modal").find(".modal-body").html(result);
            },
            error: function (error) {
            }
        });
    });
    $('.modal').on('hidden.bs.modal', function () {
        $("#info-modal").find(".modal-body").html('');
    });
    $(".quasi-sensor").click(function () {
        //var xaxis = $(this).css('transform').substr(7, ($(this).css('transform').length) - 8).split(',')[4].trim();
        //var yaxis = $(this).css('transform').substr(7, ($(this).css('transform').length) - 8).split(',')[5].trim();
        //var position = "(X-Axis = " + xaxis + "px, " + "Y-Axis = " + yaxis + "px)";
        document.getElementById("overlay").style.display = "block";
        $('.modal-dialog').css('max-width', '99%');
        $("#info-modal").find(".modal-title").html("Quasi Info");
        $(".modal-title").css('margin-left', '45%');
        var quasiID = $(this).data("quasiid");
        $.ajax({
            url: rootUrl +'/Quasi/GetSensorData',
            type: 'GET',
            data: { id: quasiID },
            success: function (result) {
                $("#info-modal").find(".modal-body").html(result);
                document.getElementById("overlay").style.display = "none";
            },
            error: function (error) {
            }
        });
        });
    $(".beacon-sensor").click(function () {
            $('.modal-dialog').css('max-width', '40%');
            $("#info-modal").find(".modal-title").html("Beacon Info");
            $(".modal-title").css('margin-left', '170px');
            var beaconID = $(this).data("beaconid");
            $.ajax({
                url: rootUrl +'/Beacon/GetByID',
                type: 'GET',
                data: { id: beaconID },
                success: function (result) {
                    $("#info-modal").find(".modal-body").html(result);
                },
                error: function (error) {
                }
            });
        });
    function UpdateDoorStatus() {
            $.ajax({
                url: rootUrl +'/Door/GetAllDoorsState',
                type: 'GET',
                success: function (result) {
                    for (var i = 7; i < 14; i++) {
                        if (result.doorList[i]) {
                            var doorID = result.doorList[i].idx;
                            if (result.doorList[i].doorStatus == "Opened" || result.doorList[i].doorStatus == "Partially-Opened") {
                                $(`#door-${doorID}`).html("meeting_room");
                            }
                            if (result.doorList[i].doorStatus == "Closed") {
                                $(`#door-${doorID}`).html("sensor_door");
                            }
                            $(`#door-${doorID}`).attr('title', result.doorList[i].doorStatus).tooltip('_fixTitle');
                        }
                    }
                },
                error: function (error) {

                }
            });
        }
    UpdateDoorStatus();
    setInterval(() => UpdateDoorStatus(), 3000);
    });
    //$(document).on("mousemove", function (event) {
    //    $("#test").text("pageX: " + event.pageX + ", pageY: " + event.pageY);
    //});