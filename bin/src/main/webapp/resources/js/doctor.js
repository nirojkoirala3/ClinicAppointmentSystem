$(function() {
	// CSRF Registration for Ajax requests
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	// Application Path
	var appPath = $("#app-path").val();
	
	// Cleanup the modal editors.
	function cleanup(){
		$("#doctorId").val("");
		$("#userId").val("");
		$("#firstName").val("");
		$("#lastName").val("");
		$("#speciality").val("CARDIOLOGIST");
		$("#email").val("");
		$("#password").val("");
		$(".modal-title").text("Add New Doctor");
	}
	
	// Show/hide the modal
	function toggleModal(show) {
		if(show) $("#doctor-modal").addClass("show");
		else $("#doctor-modal").removeClass("show");
	}
	
	// Add the Doctor (from AJAJ response) to the list or update the existing row.
	function bindDoctorToList(doctor){
		var $tr = $("#doctor-" + doctor.id);
		if ($tr.length > 0) {
			// Update the existing row.
			var $tds = $tr.find("td");
			$($tds[0]).text(doctor.firstName);
			$($tds[1]).text(doctor.lastName);
			$($tds[2]).text(doctor.speciality);
			$($tds[3]).text(doctor.email);
		}
		else {
			// Add a new row to the list.
			var $command = $("<td>").append($("<a>", {
				"class": "edit",
				"text": "Edit",
				"data-id": doctor.id,
				"data-user-id": doctor.user.id
			})).append(" | ").append($("<a>", {
				"class": "delete",
				"text": "Delete",
				"data-id": doctor.id
			}));
			$("<tr>", {
				"id" : "doctor-" + doctor.id
			}).append($("<td>", {
				"text": doctor.firstName
			})).append($("<td>", {
				"text": doctor.lastName
			})).append($("<td>", {
				"text": doctor.speciality
			})).append($("<td>", {
				"text": doctor.email
			})).append($command).appendTo($("#doctor-list"));
		}
	}
	
	// "Add Doctor" button handler
	$("#add-doctor").click(function() {
		cleanup();
		toggleModal(true);
	});
	
	// "Edit" link handler
	// Must register this way because new rows will be added dynamically.
	$("#doctor-list").on("click", ".edit", function() {
		var $link = $(this);
		var $tds = $link.parent().parent().find("td");
		$("#doctorId").val($link.attr("data-id"));
		$("#userId").val($link.attr("data-user-id"));
		$("#firstName").val($($tds[0]).text());
		$("#lastName").val($($tds[1]).text());
		$("#speciality").val($($tds[2]).text());
		$("#email").val($($tds[3]).text());
		$(".modal-title").text("Edit Doctor");
		toggleModal(true);
	});
	
	// "Delete" link handler
	// Must register this way because new rows will be added dynamically.
	$("#doctor-list").on("click", ".delete", function() {
		var $link = $(this);
		var $tr = $link.parent().parent();
		var $tds = $tr.find("td");
		var message = "Do you really want to delete '" +
			$($tds[0]).text() + " " + $($tds[1]).text() + "' doctor?";
		if (confirm(message)) {
			$.ajax({
				type: "DELETE",
				url: appPath + "admin/doctor/" + $link.attr("data-id"),
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
	$("#doctor-modal .close").click(function() {
		toggleModal(false);
	});

	// Modal "Save" button handler
	$("#save-doctor").click(function() {
		var dataToSave = {
			id: $("#doctorId").val(),
			firstName: $("#firstName").val(),
			lastName: $("#lastName").val(),
			speciality: $("#speciality").val(),
			email: $("#email").val(),
			enabled: true,
			user: {
				password: $("#password").val() || "_BLANK_"
			}
		};
		var userId = parseInt($("#userId").val()) || 0;
		if (userId > 0) {
			dataToSave.user.id = userId;
		}
		$.ajax({
			type: userId == 0 ? "POST" : "PUT",
			url: appPath + "admin/doctor",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(dataToSave),
			success: function(doctor){
				bindDoctorToList(doctor);
				cleanup();
				toggleModal(false);
			},
			error: function(errorObject){
				
			}
		});
	});
});