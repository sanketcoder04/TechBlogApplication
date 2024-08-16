// Profile Section for edit

let edit_status = false;

$(document).ready(function() {
	$('#edit-profile-button').click(function () {
		if(edit_status == false) {
			$('#profile-details').hide();	
			$('#profile-edit').show();
			$(this).text("Back");
			edit_status = true;
		}
		else {
			$('#profile-details').show();	
			$('#profile-edit').hide();
			$(this).text("Edit");
			edit_status = false;
		}
	});
});
