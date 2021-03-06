function expand(e){
  e.preventDefault()
  target = $(e.target)
  target.parent().html(target.data('detail'))
}

$(document).ready(function() {
	$('.question-more').click(expand);
})

$(document).ready(function(){
	console.log("Ready")
	// this ID here refers to the form where the user types in a URL
	var form = $('#question_form');
	form.on('submit', function(formSubmissionEvent){
		formSubmissionEvent.preventDefault();
		console.log("Prevented default action!");

		$('body').prepend('<img src="/img/spinner.gif" id="spinner" />');

		$.ajax({
			url: form.attr('action'), // same as putting "urls"
			method: form.attr('method'),
			data: form.serialize(),
			dataType: 'JSON',
			success: function(response) {
				$('#spinner').remove();
				console.log(response);

				if (response.success) {
					$('.well').after('\
					  <div class="panel panel-default">\
						 <div class="panel-heading"><h4>' + response.input + '</h4></div>\
						  <div class="panel-body">\
						  <hr>\
							<form>\
							<div class="input-group">\
							  <div class="input-group-btn">\
							  <button class="btn btn-default">Up</button><button class="btn btn-default" id="second_button">Down</button>\
							  </div>\
							  <input class="form-control" placeholder="Add a comment.." type="text">\
							</div>\
							</form>\
							\
						  </div>\
					   </div>\
					');
				}
				else {
					$("#myModal").modal()
					// window.location.href = response.data_url
				}
			},
			error: function(response){
			}
		});
	});

	vote = $('.voting');
	vote.on('submit', function(voteSubmissionEvent){
		voteSubmissionEvent.preventDefault();
		console.log("Prevented default action!");
		change_this = $(this).next()

		$('body').append('<img src="/img/spinner.gif" id="spinner" />');
		$.ajax({
			url: $(this).attr('action'), // same as putting "urls"
			method: vote.attr('method'),
			data: vote.serialize(),
			dataType: 'JSON',
			success: function(response) {
				$('#spinner').remove();
				console.log(response);

				if (response.success) {
					change_this.text(response.vote_count);
				}
				else {
					$("#myModal").modal()
					// window.location.href = response.data_url
				}
			},
			error: function(response){
			}
		});
	});

	vote_after = $('.voting_after');
	vote_after.on('submit', function(vote_afterSubmissionEvent){
		vote_afterSubmissionEvent.preventDefault();
		console.log("Prevented default action!");
		change_this = $(this).prev();

		$('body').append('<img src="/img/spinner.gif" id="spinner" />');

		$.ajax({
			url: $(this).attr('action'), // same as putting "urls"
			method: vote_after.attr('method'),
			data: vote_after.serialize(),
			dataType: 'JSON',
			success: function(response) {
				$('#spinner').remove();
				console.log(response);
				if (response.success) {
					change_this.text(response.vote_count);
				}
				else {
					$("#myModal").modal()
					// window.location.href = response.data_url
				}
			},
			error: function(response){
			}
		});
	});

	var answer = $('#answer_front_page');
	// answer.on('submit', function(answerSubmissionEvent){
	// 	answerSubmissionEvent.preventDefault();
	// 	console.log("Prevented default action!");

	// 	$('body').prepend('<img src="/img/spinner.gif" id="spinner" />');

	// 	$.ajax({
	// 		url: answer.attr('action'), // same as putting "urls"
	// 		method: answer.attr('method'),
	// 		data: answer.serialize(),
	// 		dataType: 'JSON',
	// 		success: function(response) {
	// 			$('#spinner').hide();
	// 			console.log(response);

	// 			if (response.success) {
	// 				debugger;
	// 				$('#answer_front_page').before('\
	// 				  	<div id = "answer">Answer: ' + response.input + '</div>\
	// 				  	<div id = "answer-user">User: ' + response.user_name + '</div>\
	// 					<hr>\
	// 				');
	// 			}
	// 			else {
	// 				window.location.href = response.data_url
	// 			}

	// 		},
	// 		error: function(response){
	// 			$('#spinner').hide();
	// 		}
	// 	});
	// });



	// form.on("paste", function(formSubmissionEvent){
	// 	var pastedData = formSubmissionEvent.originalEvent.clipboardData.getData('text');
	// 	document.getElementById('shorteninput').value=pastedData ;
	// 	formSubmissionEvent.preventDefault();
	// 	console.log("Prevented default action!");

	// 	$('body').prepend('<img src="/img/spinner.gif" id="spinner" />');

	// 	$.ajax({
	// 		url: form.attr('action'), // same as putting "urls"
	// 		method: form.attr('method'),
	// 		data: form.serialize(),
	// 		dataType: 'JSON',
	// 		success: function(response) {
	// 			$('#spinner').hide();
	// 			console.log(response);
	// 			var count = $("#big_table tr").length;

	// 			$('tbody').append('\
	// 				<tr>\
	// 					<td align="center">' + count + '</td>\
	// 					<td><a href="' + response.long_url + '">' + response.long_url + '</a></td>\
	// 					<td><a href="/' + response.short_url + '">' + 'https://zenly.herokuapp.com/' + response.short_url + '</td>\
	// 					<td align="center">' + response.counter + '</td>\
	// 				</tr>\
	// 				');
	// 		}
	// 	});
	// });
});