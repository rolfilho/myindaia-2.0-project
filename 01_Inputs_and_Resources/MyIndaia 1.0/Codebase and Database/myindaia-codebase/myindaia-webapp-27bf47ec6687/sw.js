var cacheName = "appmyindaia-v001001033_140219";

var filesToCache = [
    "/",
    "css/acc.css",
    "consproimp.html",
    "consproexp.html",
    "css/bootstrap.min.css",
    "css/jquery-ui.css",
    "css/jquery-ui.min.css",
    "css/style.css",
    "css/timeline.css",
    "css/conspro.css",
    "css/loader.css",
    "images/banner01.jpg",
    "images/banner53.jpg",
    "images/Home.svg",
    "images/ic_filter_white_24px.svg",
    "images/ic_refresh_white_24px.svg",
    "images/logo.png",
    "images/push-off.png",
    "images/push-on.png",
    "js/app.js",
    "js/config.js",
    "js/consprocexp.js",
    "js/consprocimp.js",
    "js/download.js",
    "js/i18n.js",
    "js/jquery-1.7.2.min.js",
    "js/jquery-3.3.1.min.js",
    "js/jquery-ui.js",
    "js/jquery-ui.min.js",    
    "js/latest.js",
    "js/logout.js",
    "js/menu.js",
    "js/offline.js",
    "js/style.js",
    "js/toast.js",
    "js/util.js",
    "js/processosEmAndamento.js",
    "js/personalizarPaginas.js"    
]

Install Service Worker

console.log('Service Worker: Iniciando Instalação.');

self.addEventListener('install', function(event) {

    console.log('Service Worker: Instalando....');

    event.waitUntil(

        // Open the Cache
        caches.open(cacheName).then(function(cache) {
            console.log('Service Worker: Caching App Shell at the moment......');

            // Add Files to the Cache
            cache.addAll(filesToCache);
        })
    );
});


//Fired when the Service Worker starts up

self.addEventListener('activate', function(event) {

    console.log('Service Worker: Ativando....');

    event.waitUntil(
        caches.keys().then(function(cacheNames) {
            return Promise.all(cacheNames.map(function(key) {
                if( key !== cacheName) {
                    console.log('Service Worker: Removendo cache antigo', key);
                    return caches.delete(key);
                }
            }));
        })
    );
    return self.clients.claim();
});


self.addEventListener('fetch', function(event) {

    //console.log('Service Worker: Fetch', event.request.url);
    //console.log("Url", event.request.url);

    event.respondWith(
        caches.match(event.request).then(function(response) {
            return response || fetch(event.request);
        })
    );
});