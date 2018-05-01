$(function() {
	// CSRF Registration for Ajax requests
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	// Application Path
	var appPath = $("#app-path").val();
	
	function formatDate(date) {
		var year = date.getFullYear();
		var month = (1 + date.getMonth()).toString();
		month = month.length > 1 ? month : '0' + month;
		var day = date.getDate().toString();
		day = day.length > 1 ? day : '0' + day;
		return month + '-' + day + '-' + year;
	}
	
	// Cleanup the modal editors.
	function cleanup(){
		$("#prescriptionId").val("");
		$("#symptomps").val("");
		$("#diagnosis").val("");
		$("#medication").val("");
		$("#dosages").val("");
		$(".modal-title").text("Add New Prescription");
	}
	
	// Show/hide the modal
	function toggleModal(show) {
		if(show) $("#prescription-modal").addClass("show");
		else $("#prescription-modal").removeClass("show");
	}
	
	// Add the Prescription (from AJAJ response) to the list or update the existing row.
	function bindPrescriptionToList(prescription){
		var date = formatDate(new Date(prescription.date));
		var $tr = $("#prescription-" + prescription.id);
		if ($tr.length > 0) {
			// Update the existing row.
			var $tds = $tr.find("td");
			$($tds[0]).text(date);
			$($tds[1]).text(prescription.symptomps);
			$($tds[2]).text(prescription.diagnosis);
			$($tds[3]).text(prescription.medication);
			$($tds[4]).text(prescription.dosages);
		}
		else {
			// Add a new row to the list.
			var $command = $("<td>").append($("<a>", {
				"class": "edit",
				"text": "Edit",
				"data-id": prescription.id
			})).append(" | ").append($("<a>", {
				"class": "delete",
				"text": "Delete",
				"data-id": prescription.id
			}));
			$("<tr>", {
				"id" : "prescription-" + prescription.id
			}).append($("<td>", {
				"text": date
			})).append($("<td>", {
				"text": prescription.symptomps
			})).append($("<td>", {
				"text": prescription.diagnosis
			})).append($("<td>", {
				"text": prescription.medication
			})).append($("<td>", {
				"text": prescription.dosages
			})).append($command).appendTo($("#prescription-list"));
		}
	}
	
	// "Add Prescription" button handler
	$("#add-prescription").click(function() {
		cleanup();
		toggleModal(true);
	});
	
	// "Edit" link handler
	// Must register this way because new rows will be added dynamically.
	$("#prescription-list").on("click", ".edit", function() {
		var $link = $(this);
		var $tds = $link.parent().parent().find("td");
		$("#prescriptionId").val($link.attr("data-id"))
		$("#symptomps").val($($tds[1]).text());
		$("#diagnosis").val($($tds[2]).text());
		$("#medication").val($($tds[3]).text());
		$("#dosages").val($($tds[4]).text());
		$(".modal-title").text("Edit Prescription");
		toggleModal(true);
	});
	
	// "Delete" link handler
	// Must register this way because new rows will be added dynamically.
	$("#prescription-list").on("click", ".delete", function() {
		var $link = $(this);
		var $tr = $link.parent().parent();
		var message = "Do you really want to delete this prescription?";
		if (confirm(message)) {
			$.ajax({
				type: "DELETE",
				url: appPath + "doctor/prescription/" + $link.attr("data-id"),
				contentType: "application/json",
				dataType: "json",
				success : function(succeeded) {
					if (succeeded) {
						// Delete the row from the list.
						$tr.remove();
					}
				},
				error: function(errorObject){
					alert("An error occurred. Please try again.")
				}
			});
		}
	});

	// Modal "Close" button handler
	$("#prescription-modal .close").click(function() {
		toggleModal(false);
	});

	// Modal "Save" button handler
	$("#save-prescription").click(function() {
		var dataToSave = {
			id: $("#prescriptionId").val(),
			symptomps: $("#symptomps").val(),
			diagnosis: $("#diagnosis").val(),
			medication: $("#medication").val(),
			dosages: $("#dosages").val(),
			appointment: {
				id: $("#appointmentId").val()
			},
			doctor: {
				id: $("#doctorId").val()
			},
			patient: {
				id: $("#patientId").val()
			}
		};
		$.ajax({
			type: "POST",
			url: appPath + "doctor/prescription",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(dataToSave),
			success: function(prescription){
				bindPrescriptionToList(prescription);
				cleanup();
				toggleModal(false);
			},
			error: function(errorObject){
				
			}
		});
	});
});