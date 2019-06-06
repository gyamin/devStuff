$.ajax({
    url: 'http://localhost:3000/index',
    type:'POST',
    dataType: 'json',
    data : {parameter1 : "1", parameter2 : "2" },
    timeout:3000,
}).done(function(data) {
    alert("ok");
}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
    alert("error");
})