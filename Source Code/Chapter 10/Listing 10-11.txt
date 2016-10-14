$.CouchApp(function(app) {
	$('form#add_task').submit(function(e) {
		e.preventDefault();
		var newTask = {
			desc: $('#desc').val()
		}
		if(newTask.desc.length > 0) {
			app.db.saveDoc(newTask, { success: function(resp) {
				$('ul#my_tasks').append('<li id="'+newTask._id+'">'
					+'<div class="desc">'+newTask.desc+'</div>'
					+'<div class="link">'
					+'<a href="#" onclick="return false;"'
					+' id="'+newTask._rev+'">Delete</a>'
					+'</div>'
					+'<div class="clear"></clear>'
					+'</li>');
				$('#'+newTask._rev).click(function() {
					if(confirm("Are you sure you want to delete this task?")) {
						var delTask = {
							_id: newTask._id,
							_rev: newTask._rev
						}
						app.db.removeDoc(delTask, {});
						$('#'+newTask._id).show().fadeOut(2000);
						var del_count = parseInt($('#task_count span').html(), 10);
						del_count--;
						$('#task_count span').html(del_count);
						return false;
					}
				});
				$('ul#my_tasks li:last').hide().fadeIn(1500);
				$('#desc').val('');
				var task_count = parseInt($('#task_count span').html(), 10);
				task_count++;
				$('#task_count span').html(task_count);
			}});
		} else {
			alert('You must enter a description to create a new task!');
		}
	});
	
	app.view("get_tasks", { success: function(json) {
		json.rows.map(function(row) {
			$('ul#my_tasks').append('<li id="'+row.value._id+'">'
				+'<div class="desc">'+row.key+'</div>'
				+'<div class="link">'
				+'<a href="#" onclick="return false;"'
				+' id="'+row.value._rev+'">Delete</a>'
				+'</div>'
				+'<div class="clear"></clear>'
				+'</li>');
			$('#'+row.value._rev).click(function() {
				if(confirm("Are you sure you want to delete this task?")) {
					var delTask = {
						_id: row.value._id,
						_rev: row.value._rev
					}
					app.db.removeDoc(delTask, {});
					$('#'+row.value._id).show().fadeOut(2000);
					var del_count = parseInt($('#task_count span').html(), 10);
					del_count--;
					$('#task_count span').html(del_count);
					return false;
				}
			});
		});
		$('#task_count span').html(json.rows.length);
	}});
});