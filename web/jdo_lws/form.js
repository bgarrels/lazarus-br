﻿/*
	Simple HTML form serializer.
	Author: Silvio Clécio - silvioprog@gmail.com
*/

// Mude para a URL de sua preferência.
var rootURL = 'http://localhost/cgi-bin/project1';

// Aqui eu desabilito o submit do form, pois preciso forçar uma validação dos dados.
$('form').submit(function() {
	return false;
});

// Aqui eu pego o evento do botão "Save" que, ao ser clicado, dá um POST para persistir os dados e limpa a tela.
$('#save').click(function() {
	addPerson();
	clearForm();
	return false;
});

// Aqui eu serializo o formulário (de uma forma meio medieval, mas isso é só um exemplo brow! :) ). A saída desta função é, por exemplo: { "name": "CHIMBICA" }
function formToJSON() {
	return JSON.stringify({
		"name": $('#name').val()
	});
}

// Limpa o form com direito a talquinho no bumbum. *-*
function clearForm() {
	$('input').val('');
}

/*
	Enfim, minha parte predileta: o ajax!
	Dou um POST com content-type do tipo JSON, caso tudo ocorra bem, o CGI se vira nos 30 para chamar a classe de persistênci e salvar o registro na tabela,
	caso algo dê errado, mostro uma mensagem com o erro.
*/
function addPerson() {
	$.ajax({
		type: 'POST',
		contentType: 'application/json',
		url: rootURL,
		dataType: 'json',
		data: formToJSON(),
		success: function(data, textStatus, jqXHR){
			alert('Person inserted succesfully!');
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('Insert person error: ' + textStatus + '\n\n' + errorThrown);
		}
	});
}