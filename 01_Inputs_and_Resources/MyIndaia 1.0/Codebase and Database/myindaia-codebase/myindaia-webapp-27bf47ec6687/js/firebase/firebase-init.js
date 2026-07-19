var messaging, 
	config = {
	    messagingSenderId: "667613920608" ,
	    //<URL_DE_ONDE_O_SERVIDOR_VAI_RECEBER_O_TOKEN_PARA_SALVAR_NA_BASE>'
	    saveTokenUrl: '/save_token'
	};

// methods
var sendRequest;
var main;
var initFirebase;
var requestPermission;
var onTokenRefreshed;
var sendTokenToServer;
var subscribeTokenToTopic;
var receiverMessage;

sendRequest = function( url, method, params, callback ) 
{
	var formData = new FormData();

	if ( params != undefined )
	{
		for ( var name in params )
		{
			formData.append( name, params[name] );
		}
	}

	var onSuccess = function( data )
    {
        callback(data);
    };

	var onErrorCaught = function( XMLHttpRequest, textStatus, errorThrown )
    {
        console.log( errorThrown );
    };

	var requestOptions = {
        url: url,
        type: method,
        data: formData,
        processData: false,
        cache: false,
        contentType: false,
        success: onSuccess,
        error: onErrorCaught
	};

	jQuery.ajax(requestOptions);
};

main = function()
{
	initFirebase();
};

initFirebase = function()
{
	firebase.initializeApp( config );
	messaging = firebase.messaging();
	messaging.onTokenRefresh(function() 
	{ 
		messaging.getToken().then( onTokenRefreshed );
	});

	// Necessário especificar caminho de onde irá ficar o service worker
	navigator.serviceWorker.register( 'sw.js' ).then( function( registration )
	{
  		messaging.useServiceWorker( registration );
  		requestPermission();
	});

	messaging.onMessage(receiverMessage);
};

requestPermission = function() 
{
	messaging.requestPermission().then(function() 
	{
		console.log('Notification permission granted.');
	  	messaging.getToken().then(onTokenRefreshed);
	}).catch(function(err) 
	{
		console.log('Unable to get permission to notify.', err);
	});
};

onTokenRefreshed = function( refreshedToken ) 
{
	console.log( 'Token has been refreshed' );
	sendTokenToServer( refreshedToken );
};

sendTokenToServer = function( currentToken )
{
	if ( currentToken )
	{
		/*sendRequest( config.saveTokenUrl, "POST", { token: currentToken }, function( json ) 
		{ 
			if (json.success)
			{
				console.log( "Token has been saved on server successfully ---> " + currentToken );
			}
		});
		subscribeTokenToTopic( currentToken );*/
		localStorage.setItem('_ct', currentToken);
		console.log("From initializer");
		console.log( "Token has been saved on server successfully ---> " + currentToken );
	}
	else 
	{
		console.log('No Instance ID token available. Request permission to generate one.');
	}
};

subscribeTokenToTopic = function( token ) 
{
	var topic = "brodacast"

	fetch( 'https://iid.googleapis.com/iid/v1/' + token + '/rel/topics/' + topic, 
	{
		method: 'POST',
		headers: new Headers({
			'Authorization': 'key=' + config.apiKey
		})
    }).then( function( response ) 
    {
    	if ( response.status < 200 || response.status >= 400 ) 
    	{	
    		throw 'Error subscribing to topic: ' + response.status + ' - ' + response.text();	
    	}
		console.log( 'Subscribed to "' + topic + '"' );
	}).catch( function( error ) 
	{
		console.log( error );
	});
};

receiverMessage = function( payload ) 
{	console.log(payload);
	if ( payload.notification != undefined ) 
	{
		var message = payload.notification.body;
		var notification = new Notification( payload.notification.title, 
		{
			icon: payload.notification.icon,
			body: payload.notification.body
		});

		notification.onclick = function () 
		{
			alert("Ação de clique na notificação")
    	};
    }
};

main();