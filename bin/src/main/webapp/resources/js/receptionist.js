/**
 * 
 */
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
		$("#receptionistId").val("");
		$("#userId").val("");
		$("#firstName").val("");
		$("#lastName").val("");
		$("#email").val("");
		$("#password").val("");
		$(".modal-title").text("Add New Receptionist");
	}
	
	// Show/hide the modal
	function toggleModal(show) {
		if(show) $("#receptionist-modal").addClass("show");
		else $("#receptionist-modal").removeClass("show");
	}
	
	// Add the Receptionist (from AJAJ response) to the list or update the existing row.
	function bindDoctorToList(receptionist){
		var $tr = $("#receptionist-" + receptionist.id);
		if ($tr.length > 0) {
			// Update the existing row.
			var $tds = $tr.find("td");
			$($tds[0]).text(receptionist.firstName);
			$($tds[1]).text(receptionist.lastName);
			$($tds[2]).text(receptionist.email);
		}
		else {
			// Add a new row to the list.
			var $command = $("<td>").append($("<a>", {
				"class": "edit",
				"text": "Edit",
				"data-id": receptionist.id,
				"data-user-id": receptionist.user.id
			})).append(" | ").append($("<a>", {
				"class": "delete",
				"text": "Delete",
				"data-id": receptionist.id
			}));
			$("<tr>", {
				"id" : "receptionist-" + receptionist.id
			}).append($("<td>", {
				"text": receptionist.firstName
			})).append($("<td>", {
				"text": receptionist.lastName
			})).append($("<td>", {
				"text": receptionist.email
			}))
			.append($command).appendTo($("#receptionist-list"));
		}
	}
	
	// "Add Receptionist" button handler
	$("#add-receptionist").click(function() {
		cleanup();
		toggleModal(true);
	});
	
	// "Edit" link handler
	// Must register this way because new rows will be added dynamically.
	$("#receptionist-list").on("click", ".edit", function() {
		var $link = $(this);
		var $tds = $link.parent().parent().find("td");
		$("#receptionistId").val($link.attr("data-id"))
		$("#userId").val($link.attr("data-user-id"));
		$("#firstName").val($($tds[0]).text());
		$("#lastName").val($($tds[1]).text());
		$("#email").val($($tds[2]).text());
		$(".modal-title").text("Edit Receptionist");
		toggleModal(true);
	});
	
	// "Delete" link handler
	// Must register this way because new rows will be added dynamically.
	$("#receptionist-list").on("click", ".delete", function() {
		var $link = $(this);
		var $tr = $link.parent().parent();
		var $tds = $tr.find("td");
		var message = "Do you really want to delete '" +
			$($tds[0]).text() + " " + $($tds[1]).text() + "' receptionist?";
		if (confirm(message)) {
			$.ajax({
				type: "DELETE",
				url: appPath + "admin/receptionist/" + $link.attr("data-id"),
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
	$("#receptionist-modal .close").click(function() {
		toggleModal(false);
	});

	// Modal "Save" button handler
	$("#save-receptionist").click(function() {
		var dataToSave = {
			id: $("#receptionistId").val(),
			firstName: $("#firstName").val(),
			lastName: $("#lastName").val(),
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
			url: appPath + "admin/receptionist",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(dataToSave),
			success: function(receptionist){
				bindDoctorToList(receptionist);
				cleanup();
				toggleModal(false);
			},
			error: function(errorObject){
				
			}
		});
	});
});