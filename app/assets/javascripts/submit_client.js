/**to change the project name with respect to the client name **/
$(document).on('change mouseenter','#qanote_clientdetail', function() {
        var nameofclient = $(this).val();
            $.ajax({
                url : '/projects/submit_client',
                dataType : 'html',
                type : 'POST',
                data : 'client_name=' + nameofclient,
                success : function(data) {
                    $('.updated_project').html(data);
                }
            });
    });
    
/**to store the value of the selected project in a hidden field to store in a db*/    
$(document).on('change blur', '#project_id', function() {
        var newvalue = document.getElementById("project_id").value;
		document.getElementById("qanote_projectname").value = newvalue;
    });

/* a way to get the server types get working**/    
$(document).on('change click blur', '#qanote_servername', function() {
    var servertype = $(this).val();
	var projecttype = document.getElementById("qanote_projectname").value;
	$.when($.ajax({
		url: '/qanotes/submit_server',
		dataType : 'html',
		type : 'POST',
		data : {servername : servertype, projectname : projecttype},
		success: function(data){
			$('.updated_oldtag').html(data)
		}
	})
).then(function() {
				 	
						var x = $('#oldtag').val();
						var i;
						var xsub;
						var s;
						for(i=(x.length-1); i>=0 && x.charAt(i)!='.'; i--)
						{
						xsub= x.substr(0, i);
						s=x.substr(i,  x.length-i);
						s= Number(s) +1;
						}
						document.getElementById("qanote_currenttag").value = xsub+s;		
				      
				 }).then(function() {/* to store the old tag in the database */
				 	var oldtagnewval = $('#oldtag').val();
	                document.getElementById("qanote_oldtag").value = oldtagnewval;
				 });
});


/* display current tag as +1 of old tag
	 $(document).on('focus','#qanote_currenttag', function() {
				 	
						var x = $('#oldtag').val();
						var i;
						var xsub;
						var s;
						for(i=(x.length-1); i>=0 && x.charAt(i)!='.'; i--)
						{
						xsub= x.substr(0, i);
						s=x.substr(i,  x.length-i);
						s= Number(s) +1;
						}
						document.getElementById("qanote_currenttag").value = xsub+s;		
				      
				  });	
				  */
$(window).unload(function() { $('select option').remove(); });