/*$(function() {
	// CSRF Registration for Ajax requests
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
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
});*/