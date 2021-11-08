$(function() {
    function format(d) {
        // `d` is the original data object for the row
        let listItem=
        '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'
        +'<tr>'
        +'<th>產品名稱</th>'
        +'<th>單價</th>'
        +'<th>數量</th>'
        +'<th>合計</th>'
        +'</tr>'
        $.ajax({
            type:'GET',
            url:'./ListItem',
            async: false,
            dataType:'json',
            data:'itemNo=' + d,
            success:function(data){	
                var json = JSON.stringify(data, null, '');
                var jsonArray = JSON.parse(json);
                let text=''
                 for(var i=0;i<jsonArray.length;i++){	   
                     text += 
                       '<tr>'
                       +'<td>'+data[i].productName+'</td>'
                       +'<td>'+data[i].price+'</td>'
                       +'<td>'+data[i].number+'</td>'
                       +'<td>'+data[i].price*data[i].number+'</td>'  
                       +'</tr>'
                   }
                 listItem+= text + '</table>'
            }
        })
        return listItem
    }
    
    $('#findAll').DataTable({
//		"scrollY":        "500px",
 //		"scrollCollapse": true,
//	    "paging":         false
    });

    var table = $('#findAll').DataTable(); 

    $('#findAll tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
        
        var td = tr.children().eq(1).text()

        if (row.child.isShown()) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            // row.child(format(row.data())).show();
            row.child(format(td)).show();
            tr.addClass('shown');
        }
    });       
})